"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug 'flazz/vim-colorschemes'
"Plug 'junegunn/vim-easy-align'
"Plug 'tpope/vim-obsession'
"Plug 'machakann/vim-sandwich'
"Plug 'easymotion/vim-easymotion'
call plug#end()

"color settings
syntax on

colo DevC++

"color settings
syntax on
hi Visual       ctermfg=0 
hi Search       ctermfg=190 ctermbg=0 cterm=UNDERLINE
hi MatchParen   ctermbg=237
hi LineNr       ctermfg=8
hi CursorLineNr ctermfg=241

"tabline colors
hi TabLineFill ctermfg=6 ctermbg=0 cterm=NONE
hi TabLine     ctermfg=6 ctermbg=0 cterm=NONE
hi TabLineSel  ctermfg=0 ctermbg=6 cterm=NONE


"statusline
set laststatus=0

autocmd FileType make setlocal noexpandtab
autocmd FileType Make setlocal noexpandtab
autocmd FileType Makefile setlocal noexpandtab
autocmd FileType makefile setlocal noexpandtab

"behavior
set autoindent
"keep 5 lines below and above the cursor
set scrolloff=5 
"tab = 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set number relativenumber
"case insensitive search
set ignorecase
set fileignorecase
"disable new line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set timeoutlen=100 ttimeoutlen=0

"use system clipboard
set clipboard=unnamedplus

"disable mouse 
imap <LeftMouse> <nop> 

"This unsets the last search pattern register by hitting enter
nnoremap <CR> :noh<CR>
nnoremap ; :

"buffer conf
set hidden
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>
inoremap <C-H> <Esc>:bprev<CR>
inoremap <C-L> <Esc>:bnext<CR>

"persistant undo
set undofile 
set undodir=~/.vim/undodir

"goodbye ex mode
nnoremap Q <nop> 

"easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
