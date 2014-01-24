syntax on

set expandtab
set tabstop=2
set shiftwidth=2
set bs=2
set number
set timeout timeoutlen=3000 ttimeoutlen=100

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles Here
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'helino/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-cucumber'
Bundle 'Shougo/neocomplete.vim'
 
" Usability Bundles
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on     " required!

" Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map ff <C-w>\|<C-w>_
map fh <C-w>hff
map fj <C-w>jff
map fk <C-w>kff
map fl <C-w>lff
map f= <C-w>=

vnoremap <S-TAB> <gv
vnoremap <TAB> >gv
