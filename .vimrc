" solarized color scheme!
syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set expandtab
set tabstop=2
set shiftwidth=2
set bs=2
set number
set timeout timeoutlen=3000 ttimeoutlen=100

set nocompatible              " be iMproved
filetype off                  " required!

set dir=~/.vim/swap//
set backupdir=~/.vim/swap//

" Use <Space> as leader
" let mapleader = "\<Space>"

" Set up vundle
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
Bundle 'wavded/vim-stylus'
Bundle 'digitaltoad/vim-jade'

" Usability Bundles
Bundle 'terryma/vim-multiple-cursors'
Bundle 'terryma/vim-expand-region'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'rking/ag.vim'
Bundle 'junegunn/goyo.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'benmills/vimux'

filetype plugin indent on     " required!

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Airline config
set laststatus=2
let g:airline_theme='lucius'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline_enable_branch=1
let g:airline_branch_prefix='⭠'
let g:airline_section_c='%t'

" Goyo config
function! s:goyo_before()
  set nonumber
endfunction
function! s:goyo_after()
  set number
endfunction
let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
nnoremap <Leader>G :Goyo<CR>

" Tslime/vim-rspec config
" let g:rspec_command = 'call Send_to_Tmux("bx rspec {spec} || return 0 Enter")'
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader><Space> :call RunLastSpec()<CR>
" map <Leader>r :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Vimux config
map <Leader><Space>  :VimuxPromptCommand<CR>
map <Leader><Leader> :VimuxRunLastCommand<CR>
map <Leader>x        :VimuxCloseRunner<CR>
map <Leader>a        :call VimuxRunCommand('Enter')<CR>

" Strip whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Space><Leader> <C-w>\|<C-w>_
map <Space>h <C-w>h<C-w>\|
map <Space>j <C-w>j<C-w>_
map <Space>k <C-w>k<C-w>_
map <Space>l <C-w>l<C-w>\|
map <Space>= <C-w>=
nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Space>t :tabedit<Space>
nnoremap <Space>n :tabnext<CR>
nnoremap <Space>b :tabprev<CR>

" Utility
nnoremap cil ^C
vnoremap <Space>r yGo:r!ag<Space>"<Esc>pa"<Space>\|<Space>head<Space>-n<Space>10<Esc>"rdd@r
vnoremap <Leader>r yGo:r!ag<Space>"<Esc>pa"<Space>\|<Space>head<Space>-n<Space>10<Esc>
nnoremap <Leader>r "rdd@r

vnoremap <S-TAB> <gv
vnoremap <TAB> >gv

inoremap {<cr> {<cr>}<c-o>O
inoremap (<cr> (<cr>)<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap ({<cr> ({<cr>})<c-o>O
inoremap {<Space> {<Space><Space>}<left><left>
inoremap (<Space> (<Space><Space>)<left><left>
inoremap [<Space> [<Space><Space>]<left><left>
inoremap ({<Space> ({<Space><Space>})<left><left><left>
inoremap {{<Space> {{<Space><Space>}}<left><left><left>
inoremap {{=<Space> {{=<Space><Space>}}<left><left><left>
inoremap {{{<Space> {{{<Space><Space>}}<left><left><left>
inoremap {{#<Space> {{#<Space><Space>}}<left><left><left>
inoremap {{/<Space> {{/<Space><Space>}}<left><left><left>
inoremap {{&<Space> {{&<Space><Space>}}<left><left><left>
inoremap <%<Space> <%<Space><Space>%><left><left><left>
inoremap <%=<Space> <%=<Space><Space>%><left><left><left>

" Speed
vmap <Space>y "+y
vmap <Space>d "+d
nmap <Space>p "+p
nmap <Space>P "+P
vmap <Space>p "+p
vmap <Space>P "+P
nmap <Space>/ 0<C-v>
nmap <Space>v 0<C-v>

" System fixes
inoremap <D-v> ^O:set paste<CR><Esc>"*p:set nopaste<CR>a
cmap w!! w !sudo tee %
cmap src source ~/.vimrc
