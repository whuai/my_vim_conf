" pathogen start
call pathogen#runtime_append_all_bundles()
" pathogen end

" vundle start
set nocompatible              " be iMproved
filetype on                 " required!
filetype plugin on

set rtp+=~/.vim/vundle
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
Bundle 'a.vim'
Bundle 'git://github.com/Lokaltog/vim-powerline'
Bundle 'rizzatti/dash.vim'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'yegappan/mru'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-abolish'
Bundle 'sjl/gundo.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" vundle end

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set nu
set hlsearch
set incsearch
set grepprg=ack
syntax on
colorscheme desert
let g:solarized_termcolors=256
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

" syntastic
let g:syntastic_check_on_open=1

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

" Tabularize mapping
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
nmap <leader>a\| :Tabularize /\|<CR>
vmap <leader>a\| :Tabularize /\|<CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
" end Tabularize mapping

" MRU mapping
nnoremap <leader>m :MRU<CR>

" Gundo mapping and settings
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 25
let g:gundo_right = 1

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips"]
nnoremap <F2> :UltiSnipsEdit<CR>
" let g:ultisnips_python_style = "GOOGLE"
