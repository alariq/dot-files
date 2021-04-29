" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" set guifont=*
" set guifont&

" set guifont=Terminus\ \(TTF)\ Medium\ 15
 set guifont=Terminus:h13
" set guifont=TerminessTTF\ Nerd\ Font\ Medium\ 12
" set guifont=Hack\ 12
" set guifont=SauceCodePro\ Nerd\ Font\ Medium\ 12
" set guifont=RobotoMono\ Nerd\ Font\ 12
" set guifont=SauceCodePro\ Nerd\ Font\ 12
" set guifont=mplus\ Nerd\ Fontour\ 12
" set  guifont=InconsolataForPowerline\ Nerd\ Font\ Medium\ 13
" set guifont=FuraCode\ Nerd\ Font\ 12
" set guifont=FuraMonoForPowerline\ Nerd\ Font\ 12
" ok
" set guifont=Iosevka\ Nerd\ Font\ Medium\ 15
" ok
" set guifont=DejaVuSansMono\ Nerd\ Font\ 11
" set guifont=CodeNewRoman\ Nerd\ Font\ 15

" remove menu and toolbar
set guioptions-=m
set guioptions-=T
" remove left and right scrollbars
set guioptions-=r
set guioptions-=L

set ts=4 sw=4 expandtab
"set colorcolumn=80

set nocompatible              " be iMproved, required
filetype off                  " required
set hidden

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes


" ALE settgins
let g:ale_disable_lsp = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_delay = 1000
" removed cppcheck, takes to much CPU cycles
let g:ale_linters = {'cpp' :['cc', 'ccls', 'clangcheck', 'clangd', 'clangtidy', 'clazy', 'cpplint', 'cquery', 'flawfinder'], }

" vim-lsp-cxx-highlight
let g:lsp_cxx_hl_use_text_props = 1

" material theme setup

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

if has('gui_running')
    let g:material_terminal_italics = 1
endif
" default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_theme_style = 'default'
" material theme setup end


" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/autoload/plug.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')

" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plug 'gmarik/Vundle.vim'
"Plug 'Valloric/YouCompleteMe' {'do': './install.py' }
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" correct
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dense-analysis/ale'
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'derekwyatt/vim-fswitch'
Plug 'ctrlpvim/ctrlp'
" colorscheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" using you complete me instead
" Plugin 'syntastic'
Plug 'will133/vim-dirdiff'
" syntax highlght
Plug 'petRUShka/vim-opencl'
Plug 'tikhomirov/vim-glsl'

Plug 'scrooloose/nerdtree'

Plug 'NLKNguyen/papercolor-theme'

if has('gui_running')
    Plug 'ryanoasis/vim-devicons'
endif

 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'Xuyuanp/nerdtree-git-plugin'

" Bundle "gilligan/vim-lldb"

" Plug 'octol/vim-cpp-enhanced-highlight'


"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

if !has('gui_running')
  set t_Co=256
else   
  " because console verion uses pixel fonts
  let g:gruvbox_italic=1
endif

set nocompatible
syntax on

 set background=dark

 " soft medium hard
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'hard' 
let g:gruvbox_number_column = 'bg1'
" colorscheme mydesert
" colorscheme gruvbox
" colorscheme PaperColor
 colorscheme material

" gruvbox material settings(medium, soft, hard)`
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_enable_bold = 1
" auto, red orange yellow green aqua blue purple'
let g:gruvbox_material_cursor = 'orange'
let g:gruvbox_material_better_performance = 1
" colorscheme gruvbox-material

" goParamName defined in material theme only
 hi link LspCxxHlSymParameter goParamName 

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

let mapleader = "\\"


set scrolloff=5

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,space:.
endif


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif



" statusline 
set laststatus=2
set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\ 
set statusline+=%r\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


" possible options: indent, eol. Or just remove to return to default
set backspace=start 
set number

set hlsearch " highlight search results

"set visualbell      " no nasty beeps

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl 


let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swap,*.swp,*.bin,*.txm,*.mp3,*.lst,*.agl"
"set t_vb=""           " no visual blinking as well (for some reason it is so slow)

" highlight full name not only icon
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" hightight shader files
let s:lightGreen = "31B53E"
let s:darkGreen = "11951E"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['vert'] = s:lightGreen " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['frag'] = s:darkGreen " sets the color of css files to blue
" Disable uncommon file extensions highlighting (this is a good idea if you are experiencing lag when scrolling. Find more about lag on next session.)
let g:NERDTreeLimitedSyntax = 1
" speed optimization
let g:NERDTreeHighlightCursorline = 0 
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp', 'hpp', 'vert', 'frag'] 

"let g:NERDTreeDisableFileExtensionHighlight = 0
"let g:NERDTreeDisableExactMatchHighlight = 1
"let g:NERDTreeDisablePatternMatchHighlight = 1

let g:NERDTreeGitStatusWithFlags = 0


" font size increase/decrease
if has("unix")
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

if has("gui_running")
    nmap <C-F11> :call FontSizeMinus()<CR>
    nmap <C-F12> :call FontSizePlus()<CR>
endif

"nnoremap <Tab> <C-w>w
nnoremap <S-Tab> :bp<CR>
nnoremap <C-Tab> :buffers<CR>:buffer<Space>

set wildchar=<Tab> wildmenu wildmode=list,full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

map <F3> :NERDTreeToggle<CR>

map <C-F7> :!cmake ..<CR>
map <F7> :unsilent make<CR>
" command -nargs=? -complet=file Make execute 'make <args>' | execute 'redraw!' | execute 'cwindow'
" map <F7> :unsilent Make<CR>
" map <silent> <C-F7> :Make %:t.o<CR>

" toggle error window copen/cclose
map <F4> :cw<CR>
autocmd FileType glsl nnoremap <F7> :GlslValidate<CR>

" You Complete Me ========================================================
nnoremap <F12> :YcmCompleter GoToDeclaration<CR>
nnoremap <F11> :YcmCompleter GoToDefinition<CR>
nnoremap <F2> :YcmCompleter FixIt<CR>


" coc ========================================================

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" to change a color of highlight change CocHighlightText
" aka highilight CocHighlightText but it is linked to CursorLine, so
" something like this should do the job:
" highlight CursorLine guibg=#4c4866

" ~coc ========================================================

" switching between cpp & h
nnoremap <Leader>q :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

map <C-K> :py3f /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/share/clang/clang-format.py<cr>

nmap <M-O> :FSHere<CR>
nmap <M-S-O> :FSSplitRight<CR>

imap kj <ESC>
imap <Caps> <ESC>

command! GlslValidate !~/prog/tools/glslangValidator %:p

" how to check if key is mapped:
" e.g.:
" :verbose imap <tab>

augroup filetypedetect
" Override filetypes for certain files
	autocmd! BufNewFile,BufRead *.frag,*.vert,*.hglsl set ft=glsl
augroup END

set runtimepath^=~/.vim/bundle/ctrlp.vim


if exists("did_load_filetypes")
	finish
endif


set tags=tags,./tags,./tags/..,


