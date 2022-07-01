"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
colorscheme gruvbox
set clipboard+=unnamedplus " Enable copy paste from other windows
set mouse=a " Scroll with mouse 
set nocompatible " Disable compatibility with vi which can cause unexpected issues.
set spell
filetype on " Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype plugin on " Enable plugins and load plugin for the detected file type.
filetype indent on " Load an indent file for the detected file type.
syntax on " Turn syntax highlighting on.
set number " Add numbers to the file.
"set relativenumber
set shiftwidth=4 " Set shift width to 4 spaces.
set tabstop=4 " Set tab width to 4 columns.
set expandtab " Use space characters instead of tabs.
set nobackup " Do not save backup files.
set noswapfile " Do not save swap files.
set scrolloff=10 " Do not let cursor scroll below or above N number of lines when scrolling.
set nowrap " Do not wrap lines. Allow long lines to extend as far as the line goes.
set incsearch " While searching though a file incrementally highlight matching characters as you type.
set ignorecase " Ignore capital letters during search.
set smartcase " Override the ignorecase option if searching for capital letters. This will allow you to search specifically for capital letters.
set showcmd " Show partial command you type in the last line of the screen.
set showmode " Show the mode you are on the last line.
set showmatch " Show matching words during a search.
set hlsearch " Use highlighting when doing a search.
set history=100 " Set the commands to save in history default number is 20.
set wildmenu " Enable auto completion menu after pressing TAB.
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('/home/slump/.config/nvim/plugins')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mikelue/vim-maven-plugin'
Plug 'preservim/tagbar'
Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'frazrepo/vim-rainbow'
Plug 'dense-analysis/ale'
Plug 'stevearc/vim-arduino'
call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set the backslash as the leader key.
let mapleader = "\\"

" Press \\ to jump back to the last cursor position.
" nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not displkay output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc> :nohlsearch<CR> 
inoremap <Esc> <Esc> :nohlsearch<CR> 

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F2> :NERDTreeFind<cr>
nnoremap <F3> :NERDTreeToggle<cr>
nnoremap <F12> :PlugInstall<cr>

source $HOME/.config/nvim/ftplugin/arduino.vim

nnoremap <leader>r <Plug>(coc-rename)
nnoremap <leader>ca <Plug>(coc-codelens-action)
nnoremap <leader>f <Plug>(coc-format)
nnoremap <leader>R <Plug>(coc-references)

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$', '\.tar$', '\.7z$', '\.tar.bz2$','\.docx','\.xlsx']
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=/home/slump/.config/nvim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set nocursorline 
augroup END

" Activate rainbow bracket globaly
let g:rainbow_active = 1

" Define path to node
let g:coc_node_path = "/usr/bin/node"

luafile $HOME/.config/nvim/vimfiles/treesitter.lua

" Open NERDTree without arg
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in”) | NERDTree | endif

let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeMapOpenInTab'<ENTER>'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:coc_global_extensions = ['coc-json', 'coc-git']

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
