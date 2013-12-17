" pathogen start
call pathogen#runtime_append_all_bundles()
" pathogen end

" vundle start
set nocompatible              " be iMproved
filetype on                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'DavidEGx/ctrlp-smarttabs'
" vundle end

set nu
set hlsearch
syntax on
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_autoshowtag = 1
nnoremap <F3> :CtrlPSmartTabs<CR>
nnoremap <F4> :CtrlP<CR>
