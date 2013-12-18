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
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/majutsushi/tagbar'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/klen/python-mode.git'
"Bundle 'klen/python-mode'
" vundle end

set nu
set hlsearch
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_autoshowtag = 1
let NERDTreeWinPos = 1
nmap <F7> :NERDTreeToggle<CR>
nnoremap <F3> :CtrlPSmartTabs<CR>
nnoremap <F4> :CtrlP<CR>
