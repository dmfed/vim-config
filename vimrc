" Most general options

set autowrite
set mouse=a
" Show line numbers
set number

" Show line numbers relative to current position
set relativenumber

" Highlight search
set hlsearch

" Show customs commands (starting with <leader>)
" as they are entered
set showcmd

" Don't show current mode 
" (since we're using lightline plugin)
set noshowmode

" This is needed for lightline to display properly
" in my setup 
set laststatus=2

" Let's tell between filetypes 
" and indent properly
filetype plugin indent on
syntax enable

" If we'd like to set a theme
" set background=dark OR set background=light
" colorscheme solarized
" colorscheme default
colorscheme desert

" Start custom commands with a , (comma)
" and set slightly longer timeout
noremap <SPACE> <Nop>
let mapleader = " "
set timeoutlen=1200
inoremap jk <Esc>

" Faster write and write'n'quit
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>wq :wq<cr>

" Toggle relative numbers on/off 
map <leader>rn :set invrelativenumber<cr>

" Navigating tabs
map <leader>tn :tabnew
map <leader>tt :tabnext<cr>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 10gt
map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

" Make sure we have vim-plug from the beginning
" If missing - install it and all plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.vim/plugged')
" Go plugin using gopls and standard tools
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Official Rust plugin
Plug 'rust-lang/rust.vim'
" NERDTree is a file manager pane
Plug 'preservim/nerdtree'
" lightline displays current editor mode, ruler etc.
Plug 'itchyny/lightline.vim'
call plug#end()

" NERDTree specific bindings and settings follow
"
" Start NERDTree and move cursor to opened file.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Use nn to toggle Nerd Tree on/off
map <leader>nn :NERDTreeToggle<cr>

" Go (vim-go) specific bindings and settings follow
"
au filetype go inoremap <buffer>??? <C-x><C-o>
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
map <leader>gb :GoBuild<cr>
map <leader>gt :GoTest<cr>
map <leader>gr :GoRun %<cr>
" autocmd CompleteDone * pclose
