" solarized color scheme!
syntax enable
set number
colorscheme lucario
highlight clear

set expandtab
set tabstop=2
set shiftwidth=2
set bs=2
set timeout timeoutlen=3000 ttimeoutlen=100
set scrolloff=4

set nocompatible              " be iMproved
filetype off                  " required!

set dir=~/.vim/swap//
set backupdir=~/.vim/swap//

" Use <Space> as leader
" let mapleader = "\<Space>"

" Change cursor on insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Set up vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Syntax Plugins
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'helino/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-cucumber'
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'
Plugin 'Keithbsmiley/swift.vim'

" Usability Plugins
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'rking/ag.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'benmills/vimux'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on     " required!

set wildmenu

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Startify config
let g:startify_custom_header=[
\ '',
\ '',
\ '   |',
\ '   |',
\ '   |  To see the world, things dangerous to come to;',
\ '   |            to see behind walls, to draw closer;',
\ '   |                to find each other, and to feel.',
\ '   |                    That is the purpose of life.',
\ '   |',
\ '   |',
\ '',
\ '',
\ ]

" Airline config
set laststatus=2
let g:airline_theme='lucius'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline#extentions#branch#enabled=1
let g:airline_symbols#branch='⭠'
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

let g:user_emmet_leader_key='<Leader>,'

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
map <Leader>u        :call VimuxRunCommand('up')<CR>

" Strip whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

if empty($VI_IGNORE_WHITESPACE)
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
endif

" WrapWith
" fun! WrapWith(wrapper)
"   exe ':s/\(.*\)/'.wrapper.'\1'.wrapper.'/'
" endfun

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
nnoremap <Leader>t :tabedit<Space>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>p :tabnext<CR>
nnoremap <Leader>b :tabprev<CR>
nnoremap <Leader>] :bn<CR>
nnoremap <Leader>[ :bp<CR>
nnoremap <Space>e :Explore<CR>
cmap lb ls<CR> :b

" Utility
nnoremap cil ^C

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
nmap <Space>y :call system('nc localhost 8377', @0)<CR>

" Nav
vnoremap <Space>r yGo<C-O>mr!rar!<CR>:r!ag<Space>"<Esc>pa"<Space>\|<Space>head<Space>-n<Space>10<Esc>"rdd@r
nnoremap <Space>r viwyGo<C-O>mr!rar!<CR>:r!ag<Space>"<Esc>pa"<Space>\|<Space>head<Space>-n<Space>10<Esc>"rdd@r
vnoremap <Leader>r yGo<C-O>mr!rar!<CR>:r!ag<Space>"<Esc>pa"<Space>\|<Space>head<Space>-n<Space>10<Esc>
nnoremap <Leader>r "rdd@r
nnoremap <Space>n <C-w>f
nnoremap <Space>v :vertical wincmd f<CR>
" nnoremap <Space>e gf! (needs work)
nnoremap dr mmG?!rar!<CR>dG'm


" System fixes
inoremap <D-v> ^O:set paste<CR><Esc>"*p:set nopaste<CR>a
cmap w!! w !sudo tee %
cmap src source ~/.vimrc
