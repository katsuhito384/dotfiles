" ------------------------------------------------------------
"
" 色設定

if has("syntax")
  syntax on

  "highlight LineNr ctermfg=darkyellow guifg=darkyellow
  highlight NonText ctermfg=darkgrey gui=NONE guifg=darkcyan
  highlight Folded ctermfg=blue
  highlight SpecialKey cterm=underline ctermfg=darkgrey guifg=darkcyan

  highlight Cursor ctermbg=darkyellow guibg=darkyellow
  highlight CursorIM ctermbg=red guibg=red

  " 256color settings
  if &term=='xterm-256color'
   " colorscheme orangeocean256
	highlight Normal ctermbg=none
  else
    colorscheme ron
    highlight CursorLine cterm=underline ctermbg=darkgrey guibg=black
    highlight CursorColumn cterm=none ctermbg=darkgrey guibg=black
  endif

  " カレントウィンドウにのみ罫線を引く
  augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorcolumn nocursorline
    autocmd WinEnter,BufRead * set cursorcolumn cursorline
    " PHPで重いので使わない
    autocmd WinEnter,BufRead *.php set nocursorcolumn nocursorline
  augroup END
endif


" filetype specific
"----------------------------------------------------------
filetype plugin indent on
autocmd FileType python set ts=4 sts=4 sw=4 noet noci si ai cinwords=if,elif,else,for,while,try,except,finally,def,class,with indentkeys+=#


" tab
"----------------------------------------------------------
set et ts=2 sw=2 sts=2
set list listchars=tab:>-,eol:$,trail:*

" edit
"-----------------------------------------------------------
set autoindent
set cindent
set backspace=indent,eol,start
set showmatch " show matching parentheses
set wildmenu
set formatoptions+=mM
set ambiwidth=double " for UTF-8 kigou
set vb t_vb=
set showmode

" use mouse in terminal
set mouse=a
set ttymouse=xterm2

" highlight, incremental
set hlsearch
set incsearch

set statusline=\[%n%{bufnr('$')>1?'/'.bufnr('$'):''}%{winnr('$')>1?':'.winnr().'/'.winnr('$'):''}\]\ %<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%c%V%8P

set number
set laststatus=2

set termencoding=utf-8
set encoding=utf-8
" set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fenc=utf-8

set browsedir=current
set shellslash

set scrolloff=5

" 画面最下行の行を出来るだけ表示
set display=lastline

" omni complete
"-----------------------------------------------------------
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

"-----------------------------------------------------------
" keymaps
"-----------------------------------------------------------

" ========================= normal mode
" noh on ESCs
nmap <ESC><ESC> ;noh<CR>

" graphical j/k (dangerous for scripts)
"nnoremap j gj
"nnoremap k gk

" insert CR
nnoremap <C-J> o<ESC>j
nnoremap <CR> o<ESC>j
nnoremap O o<ESC>

" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" " カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" save if updated on double Leader
noremap <Leader><Leader> ;up<CR>

" up/down prev/next => center
nnoremap <C-I> <C-I>zz
nnoremap <C-O> <C-O>zz

" yank to line end
nnoremap Y y$

" exit
nnoremap QQ ;qa<CR>

" buffer next/prev
nnoremap <C-N> ;bn<CR>
nnoremap <C-P> ;bp<CR>
nnoremap <S-Tab> ;bp<CR>

" window prev (ref: window next: C-W C-W)
nnoremap <C-W><C-P> <C-W><S-W>

" tab
nnoremap <C-K>c ;tabnew<CR>
nnoremap <C-K>d ;tabclose<CR>
nnoremap <C-K><C-D> ;tabclose<CR>
nnoremap <C-K>o ;tabonly<CR>
nnoremap <C-K><C-O> ;tabonly<CR>
nnoremap <C-K><C-P> gT
nnoremap <C-K>h gT
nnoremap <C-K><C-N> gt
nnoremap <C-K><C-K> gt
nnoremap <C-K>l gt
nnoremap <C-Tab> gt

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
noremap : ;

" ========================= visual mode
" select to line end
vnoremap v $h

" search under visual selection
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" ========================= command mode
" emacs keymap
cmap <C-A> <Home>
cmap <C-E> <End>
cmap <C-F> <Right>
cmap <C-B> <Left>

" noh on ESCs
cmap <ESC><ESC> <C-C>;noh<CR>


" ========================= insert mode
" YYYYMMDD, YYYYMMDD-HHMM
inoremap <F5> <C-r>=strftime('%Y%m%d')<CR>
inoremap <F6> <C-r>=strftime('%Y%m%d-%H%M')<CR>
imap <c-e> <esc>A
imap <c-a> <esc>0i
imap <c-d> <esc>lxi
imap <c-k> <esc>c$
imap <c-y> <esc>Pa
imap <c-f> <esc>la
imap <c-b> <esc>ha
imap { {}<esc>i
imap [ []<esc>i
imap ( ()<esc>i
imap ,t ;tabnew



" return to normal mode and suspend
inoremap <C-Z> <ESC><C-Z>

" move to line end
inoremap <C-L> <C-O>A
inoremap <C-A> <C-O>I

" Use modeline
:set modeline
:set modelines=4

" fold
set foldmethod=marker
set tags=tags

"for vundle
set nocompatible
filetype off
set rtp+=~/dotfiles/vimfiles/vundle.git/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
filetype plugin indent on

"Unite.vim
" 入力モードで開始する
 let g:unite_enable_start_insert=1
 " バッファ一覧
nnoremap <silent> <space>ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> <space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> <space>ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> <space>um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> <space>uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> <space>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q))))
