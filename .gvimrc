set guifont=Terminus\ \(TTF)\ Medium\ 15
if has('gui_running')
    colorscheme material
    echo 'gui running'
else
    colorscheme gruvbox
    echo 'gui NOT running'
endif

