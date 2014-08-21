" pathogen start
call pathogen#runtime_append_all_bundles()
" pathogen end

" vundle start
set nocompatible              " be iMproved
filetype on                 " required!
filetype plugin on

set rtp+=~/.vim/vundle
call vundle#rc()

" Map leader and localleader key to comma
 let mapleader = ","
 let g:mapleader = ","
 let maplocalleader = ","
 let g:maplocalleader = ","

" let Vundle manage Vundle
" required! 
" Bundle 'gmarik/vundle'
Bundle 'DavidEGx/ctrlp-smarttabs'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/majutsushi/tagbar'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
" Bundle "davidhalter/jedi-vim"
Bundle 'https://github.com/Valloric/YouCompleteMe.git'
Bundle 'a.vim'
Bundle 'git://github.com/Lokaltog/vim-powerline'
Bundle 'rizzatti/dash.vim'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'

" align text :Tab /pattern
Bundle 'godlygeek/tabular'                             

" <leader>m  :MRU
Bundle 'yegappan/mru'                                  

" gcc gcip
Bundle 'vim-scripts/tComment'                          

" :S/note{,s}/entr{y,ies}/g
Bundle 'tpope/vim-abolish'                             

" <F5> :GundoToggle
Bundle 'sjl/gundo.vim'                                 

" <c-l>
Bundle 'SirVer/ultisnips'                              

Bundle 'airhuman/vim-snippets'

Bundle 'jmcantrell/vim-virtualenv'

Bundle 'vim-scripts/Command-T'
" vundle end

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set nu
set hlsearch
set incsearch
set ignorecase
set smartcase
set grepprg=ack
syntax on
colorscheme desert
let g:solarized_termcolors=256
nnoremap <silent> <leader>2 :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_autoshowtag = 1
let NERDTreeWinPos = 1

let tags = "./tags"
nnoremap <silent> <leader><tab> :NERDTreeToggle<CR>
nnoremap <F3> :CtrlPSmartTabs<CR>

" Q: Closes the window
nnoremap Q :q<cr>
" close all windows
nnoremap <leader>Q :qa!<cr>

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" jedi-vim
let g:jedi#completions_command = "<C-N>"


" syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files=[".*\.py$"]
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc' 
let g:syntastic_cpp_checkers = ['cpplint']

" for YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/etc/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_confirm_extra_conf = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <silent> <Leader>d :YcmCompleter GoToDefinition<cr>
nnoremap <silent> <Leader>g :YcmCompleter GoToDeclaration<cr>
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
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2 et
  autocmd FileType c setlocal ts=4 sts=4 sw=4 et
  autocmd FileType shell setlocal ts=4 sts=4 sw=4 et
  autocmd FileType java setlocal ts=4 sts=4 sw=4 et
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
nnoremap <leader>M :MRU<CR>

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
"

" copy
set clipboard=unnamed

" easy move between tabs
map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>

" easy move around windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" sort
vnoremap <leader>s :sort<cr>

" easy move code blocks
vnoremap < <gv 
vnoremap > >gv 

" command-T
let g:CommandTCancelMap='<c-c>'

" ctrl+k ctrl+l dictionary completion
set dictionary+=/usr/share/dict/words

