"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/shinji/.cache/dein//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/shinji/.cache/dein/')

" Let dein manage dein
" Required:
call dein#add('/home/shinji/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" formatter add : 2020/2/23
call dein#add('rhysd/vim-clang-format')
call dein#add('kana/vim-operator-user')

" easy comment out 2020/2/23
call dein#add('tyru/caw.vim')


" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:airline_powerline_fonts = 1
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
set laststatus=2

"setting
set background=dark
syntax on
"colorscheme solarized
set shiftwidth=2
set smartindent
set hlsearch
"set cursorline
set visualbell
set tabstop=2
set expandtab
set number
set showcmd
map ; :
set fileencodings=utf-8,euc-jp,sjis
noremap j gj
noremap k gk
set clipboard=unnamedplus

"for fzf
set rtp+=~/.fzf

" for caw.vim
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

function! s:clang_format()
  let now_line = line(".")
  exec ":%! clang-format"
  exec ":" . now_line
endfunction

if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
  augroup END
endif
