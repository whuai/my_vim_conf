" pathogen start
call pathogen#runtime_append_all_bundles()
" pathogen end

" vundle start
set nocompatible              " be iMproved
filetype on                  " required!
filetype plugin on

set rtp+=~/.vim/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
" Bundle 'gmarik/vundle'
Bundle 'DavidEGx/ctrlp-smarttabs'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/majutsushi/tagbar'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/Valloric/YouCompleteMe.git'
" Bundle 'https://github.com/rkulla/pydictiion.git'
" Bundle 'https://github.com/klen/python-mode.git'
" Bundle 'c.vim'
Bundle 'a.vim'
Bundle 'grep.vim'
" Bundle 'OmniCppComplete'
" vundle end

set nu
set hlsearch
syntax on
"set tabstop=2
"set shiftwidth=2
"set expandtab
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_autoshowtag = 1
let NERDTreeWinPos = 1
nmap <F7> :NERDTreeToggle<CR>
nnoremap <F3> :CtrlPSmartTabs<CR>
nnoremap <F4> :CtrlP<CR>

" pydictiion start
" filetype plugin on
" let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
" let g:pydiction_menu_height = 20
" pydictiion end 


let tags = "./tags"

" for YCM
let mapleader = ","
let g:ycm_global_ycm_extra_conf = '~/.vim/etc/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

