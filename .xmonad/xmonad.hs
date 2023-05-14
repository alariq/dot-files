import XMonad

import XMonad.Layout.IndependentScreens as LIS

import XMonad.Hooks.DynamicLog
import System.IO

import XMonad.Layout.Tabbed
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers -- isFullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace -- onWorkspaces

import XMonad.Actions.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86  
-- Prompt
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)
import XMonad.Prompt.AppendFile (appendFilePrompt)

-- consult those web pages for nice guide on configuration
-- http://www.linuxandlife.com/2011/11/how-to-configure-xmonad-arch-linux.html
-- http://thinkingeek.com/2011/11/21/simple-guide-configure-xmonad-dzen2-conky/
-- http://beginners-guide-to-xmonad.readthedocs.org/configure_xmobar.html




myXmonadBar = "dzen2 -dock -x '1000' -y '0' -h '24' -w '920' -ta 'r' -fg '#FFFFFF' -bg '#1B1D1E'"
myStatusBar = "conky -c /home/a/.xmonad/.conky_dzen | dzen2 -w '1000' -h '24' -ta 'l' -bg '#1B1D1E' -fg '#FFFFFF' -y '0'"

main = do
    dzenLeftBar <- spawnPipe myXmonadBar
    dzenRightBar <- spawnPipe myStatusBar
    xmonad $ docks def
        { terminal              = myTerminal
        , workspaces            = myWorkspaces
        --, keys                = keys
        ,modMask                = mod1Mask -- use Alt key as modifier, see xmodmap, mod4Mask - Win key
        ,layoutHook             = myLayout 
        , handleEventHook       = fullscreenEventHook
        , manageHook            = myManageHook
        , logHook               = dynamicLogWithPP $ byorgeyPP { ppOutput = hPutStrLn dzenLeftBar }
        , normalBorderColor     = colorNormalBorder
        , focusedBorderColor    = colorFocusedBorder
        , borderWidth           = 1
    } `additionalKeys`
-- for keys config example see here
-- https://wiki.haskell.org/Xmonad/Config_archive/Template_xmonad.hs_%280.8%29
        [ ((0, xK_Print), spawn "scrot --silent -e 'mv $f ~/screenshots/'")
        , ((mod1Mask,  xK_Print), spawn "scrot --silent --select -e 'mv $f ~/screenshots/'")
        , ((mod1Mask,  xK_a), spawn "~/scripts/select_audio_device.sh")
        , ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight +5") 
        , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -5") 
        , ((0, xF86XK_AudioRaiseVolume), spawn "amixer sset 'Master' 10%+") 
        , ((0, xF86XK_AudioLowerVolume), spawn "amixer sset 'Master' 10%-") 
        , ((0, xF86XK_AudioMute), spawn "amixer sset 'Master' toggle") 
        , ((mod1Mask , xK_b     ), sendMessage ToggleStruts)
        , ((mod1Mask , xK_v     ), spawn "nvim-qt")
        ]

-- myTerminal = "gnome-terminal"
myTerminal = "urxvt"

myWorkspaces = ["1:main","2:dev", "3:web","4:chat","5:music", "6:gimp", "7:full"]

colorNormalBorder   = "#CCCCC6"
colorFocusedBorder  = "#000000" --"#fd971f"

myLayout = onWorkspaces ["7:full"] layoutFull $ customLayout

layoutFull = noBorders $ fullscreenFloat Full
--layoutFull = noBorders Full

customLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full ||| fullscreenFull Full ||| tabbed shrinkText def
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

-- for some docs about this check 
-- https://wiki.haskell.org/Xmonad/General_xmonad.hs_config_tips

myManageHook = (composeAll . concat $
    [ 
        -- this somehow enables borders on fullscreen apps
        [className  =? c --> doFloat           | c <- myFloating   ]
        ,[isFullscreen --> doFullFloat ]
        ,[className  =? c --> doShift  "4:chat"     | c <- myChat       ]
        ,[manageDocks] 
        ,[fullscreenManageHook]
    ]) where
        name      = stringProperty "WM_CLASS" -- see xprop
        myChat = ["Skype", "Pidgin"]
        myFloating = ["Gimp", "mplayer2", "vlc", "Skype", "Java OpenStreetMap Editor", "org-openstreetmap-josm-Main", "xcal", "XCal", "deluge", "loimpress", "qjackctl", "ardour", "Ardour-5.12.0", "libreoffice", "gmrun", "tor"]


-- see next link for some docs about it
-- http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Hooks-DynamicLog.html#v:dynamicLogWithPP
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ def
    {
        ppCurrent           =   dzenColor "#ebac54" "#1B1D1E" . pad
      , ppVisible           =   dzenColor "white" "#1B1D1E" . pad
      , ppHidden            =   dzenColor "white" "#1B1D1E" . pad
      , ppHiddenNoWindows   =   dzenColor "#7b7b7b" "#1B1D1E" . pad
      , ppUrgent            =   dzenColor "#ff0000" "#1B1D1E" . pad
      , ppWsSep             =   " "
      , ppSep               =   "  |  "
      , ppTitle             =   (" " ++) . dzenColor "white" "#1B1D1E" . dzenEscape
      , ppOutput            =   hPutStrLn h
    }

-- Theme 
{-
-- Color names are easier to remember:
colorOrange         = "#FD971F"
colorDarkGray       = "#1B1D1E"
colorPink           = "#F92672"
colorGreen          = "#A6E22E"
colorBlue           = "#66D9EF"
colorYellow         = "#E6DB74"
colorWhite          = "#CCCCC6"
      
colorNormalBorder   = "#CCCCC6"
colorFocusedBorder  = "#fd971f"
       
        
barFont  = "terminus"
barXFont = "inconsolata:size=12"
ftFont = "xft: inconsolata-14"
-}

-- Prompt Config
{-
mXPConfig :: XPConfig
mXPConfig = defaultXPConfig {
    font                    = barFont
    , bgColor               = colorDarkGray
    , fgColor               = colorGreen
    , bgHLight              = colorGreen
    , fgHLight              = colorDarkGray
    , promptBorderWidth     = 0
    , height                = 14
    , historyFilter         = deleteConsecutive
}
largeXPConfig :: XPConfig
largeXPConfig = mXPConfig {
    font = xftFont
    , height = 22
}
-}

{-
togglevga = do
    screencount <- LIS.countScreens
    if screencount > 1
        then spawn "xrandr --output HDMI1 --off"
        else spawn "xrandr --output HDMI1 --auto --right-of LVDS1"
-}


