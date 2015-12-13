" Swapfiles
set dir=~/.config/nvim/swap// backupdir=~/.config/nvim/swap//

" Timeouts
set notimeout timeoutlen=1000 ttimeoutlen=0

" Tabs
set expandtab tabstop=2 shiftwidth=2

" Scroll Padding
set scrolloff=4

" Numbers
set number

" Change cursor on insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

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

call plug#begin()
Plug 'bendyorke/oceanic-next'
Plug 'pangloss/vim-javascript'
Plug 'helino/vim-json'
Plug 'mxw/vim-jsx'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'benekastah/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'hail2u/vim-css3-syntax'
Plug 'skammer/vim-css-color'
call plug#end()

" filetype
filetype plugin indent on

" vim-jsx
let g:jsx_ext_required = 0

" Airline
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline#extentions#branch#enabled=1
let g:airline_symbols#branch='⭠'
let g:airline_section_c='%t'
let g:airline_theme='oceanicnext'

" Emmet
let g:user_emmet_leader_key='<Leader>,'

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufRead * Neomake
nmap <Leader><Leader> :ll<cr>

" Autopairs
let g:AutoPairs = {'(':')', '[':']', '{':'}'}
let g:AutoPairsShortcutJump = '<Leader>e'

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
map <c-f> <esc>:FZF -m<cr>

" Theme
highlight clear
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colo OceanicNext

" Explore
map <Space>e <ESC>:Explore<CR>

" Panes
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <Space>h <C-w>h<C-w>\|
map <Space>j <C-w>j<C-w>_
map <Space>k <C-w>k<C-w>_
map <Space>l <C-w>l<C-w>\|
map <Space>= <C-w>=
map <Space>mh 500<c-w><<c-w>h
map <Space>mj 500<c-w>-<c-w>j
map <Space>mk 500<c-w>-<c-w>k
map <Space>ml 500<c-w><<c-w>l

" Tabs
nmap <Leader>t :tabedit<cr>
nmap [t :tabprev<cr>
nmap ]t :tabnext<cr>

" Motions
nmap cil ^C
vmap <Leader>s c''<Esc>Pvi':s/\([A-Z]\)/_\1/g<CR>`>vi'gu"sci'<Esc>xx"sP
vmap <Leader>S c''<Esc>Pvi':s/\([A-Z]\)/_\1/g<CR>`>vi'gU"sci'<Esc>xx"sP

" Registers
nmap <Space>y :call system('nc localhost 8377', @0)<CR>

" init.vim
cmap w!! w !sudo tee %
command Src source ~/.config/nvim/init.vim
command Erc tabedit ~/.config/nvim/init.vim
command W w
command Q q
command Wq wq
command WQ wq
