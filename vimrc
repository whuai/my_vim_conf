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
" Bundle 'grep.vim'
" Bundle 'bling/vim-airline'
Bundle 'git://github.com/Lokaltog/vim-powerline'
" Bundle 'OmniCppComplete'
Bundle 'rizzatti/dash.vim'
" Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
" vundle end

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set nu
set hlsearch
set incsearch
set grepprg=ack
syntax on
" set background=dark
colorscheme desert
let g:solarized_termcolors=256
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set expandtab
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

" let g:syntastic_check_on_open=1
" for YCM
let mapleader = ","
let g:ycm_global_ycm_extra_conf = '~/.vim/etc/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_confirm_extra_conf = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Shutdown ycm_auto_trigger
nnoremap <F9> :let g:ycm_auto_trigger = 0<CR>
" Reopen ycm_auto_trigger
nnoremap <F10> :let g:ycm_auto_trigger = 1<CR>

" powerline
set laststatus=2
set t_Co=256
let g:Powerline_cache_enabled = 1
let g:Powerline_mode_n = 'NORMAL'
" let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_stl_path_style = 'relative'
" end powerline
"
"
if has("autocmd")
  filetype on
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType cc setlocal ts=2 sts=2 sw=2 et
  autocmd FileType shell setlocal ts=8 sts=8 sw=8
endif
