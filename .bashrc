#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    rxvt-unicode-color256) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#PS1='[\u@\h \W]\$ '
if [ "$color_prompt" = yes ]; then
    PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$(git branch 2>/dev/null | grep '^*' | colrm 1 2) \$ "
else
    PS1="\u@\h:\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

export EDITOR=nvim
export VISUAL="$(if [[ -n $DISPLAY ]]; then echo 'gvim'; else echo 'vim'; fi)"


# to fox problem with xmonad when java application appears as white rectangle without drawing aything on it
export _JAVA_AWT_WM_NONREPARENTING=1
# turn on Anti-Aliasing in fonts
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# disallow wine to owerride default programs associated with file extensions
export WINEDLLOVERRIDES="winemenubuilder.exe=d"

PATH="/home/a/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/a/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/a/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/a/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/a/perl5"; export PERL_MM_OPT;

source ~/prog/3rdparty/vulkan-sdk/1.2.141.2/setup-env.sh

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias gs='git status'
alias gl='git log --oneline'

source ~/passwdgen.bash

#set mouse sensitivity (was used for a diferent mouse then I have now)
#xinput --set-prop 18 318 -0.75

#set key repeat rate and delay after first press
xset r rate 300 50

#map caps to super
#setxkbmap -option caps:super -variant altgr-intl

# treat capc as escape if pressed once
killall xcape 2>/dev/null ; xcape -e 'Caps_Lock=Escape'

# LibreOffice - focus flicking between main window and dialog
export SAL_USE_VCLPLUGIN=gen lowriter

export BROWSER=firefox

# make gamma look fonts more nice in the Firefox
xrandr --output LVDS1 --gamma 0.8

set OPENCV_DNN_TEST_DATA_PATH=~/opencv/dnn_test_data/

# remap left and right buttons on my vertical wireless mouse
source ~/scripts/switch_mouse_lr_buttons.sh

