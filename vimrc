" Most general options
set number
set autowrite
set mouse=a

" Let's tell between filetypes 
" and indent properly
filetype plugin indent on
syntax enable

" If we'd like to set a theme
" set background=dark OR set background=light
" colorscheme solarized

" Start custom commands with a , (comma)
" and set slightly longer timeout
let mapleader = ","
set timeoutlen=1500

" Faster write and write'n'quite
map <leader>w :w<cr>
map <leader>wq :wq<cr>

" Navigating tabs
map <leader>tn :tabnew
map <leader>ty :tabn<cr>
map <leader>tr :tabp<cr>


" Show customs commands as they are
" entered
set showcmd

" Don't show current mode 
" (since we're using lightline plugin)
set noshowmode

" This is needed for lightline to display properly
" in my setup 
set laststatus=2

" Make sure we have vim-plug from the beginning
" If missing - install it and all plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.vim/plugged')
" Go plugin using gopls and standard tools
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Official Rust plugin
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
call plug#end()

" NERDTree specific bindings follow
"
" Start NERDTree and move cursor to opened file.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Use nn to toggle Nerd Tree on/off
map <leader>nn :NERDTreeToggle<cr>

" Go (vim-go) specific bindings follow
"
let g:go_fmt_command = "goimports"
map <leader>gb :GoBuild<cr>
map <leader>gt :GoTest<cr>
map <leader>gr :GoRun<cr>

