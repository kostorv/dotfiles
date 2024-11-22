colorscheme industry
set nocp
filetype plugin on
filetype on
filetype indent on
syntax on
set number

" netrw settings
"let g:native_sidebar_shortcut = '<c-t>'
let g:netrw_keepdir = 0
let g:netrw_winsize = 10
let g:netrw_banner = 0

augroup InitNetrw
  autocmd!
  autocmd VimEnter * if expand ("%") == "" | edit . | endif
augroup END

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

"  Plug 'vim-scripts/native-sidebar.vim'

call plug#end()

" }}}
