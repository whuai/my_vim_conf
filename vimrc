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
Bundle 'https://github.com/Valloric/YouCompleteMe.git'
Bundle 'a.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'scrooloose/syntastic'

" align text :Tab /pattern
Bundle 'godlygeek/tabular'                             
Bundle 'plasticboy/vim-markdown'

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

"easy motion
Bundle "Lokaltog/vim-easymotion"

" for cpp code format
Bundle "rhysd/vim-clang-format"

" vim-surround
Bundle "tpope/vim-surround"

" cscope
Bundle "vim-scripts/cscope.vim"

" vim-airline
Bundle "bling/vim-airline"

" ag.vim for searching codes
Bundle 'rking/ag.vim'

Bundle 'vim-scripts/highlight.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'Chiel92/vim-autoformat'
Bundle 'altercation/vim-colors-solarized'

" .(dot) command for not just the last native comand
" but also the last plugin command.
Bundle 'tpope/vim-repeat'

" <leader>bt <leader>bs <leader>bv
Bundle 'jlanzarotta/bufexplorer'

" for markdown preview
Bundle 'shime/vim-livedown'

Bundle 'jiangmiao/auto-pairs'
" vundle end

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set hidden
" for help
set wildmenu
set wildmode=longest:full,full
" set wildmode=list:longest,full

set nofoldenable
set nu
set hlsearch
" Clear the last hlsearch results
nnoremap <F4> :let @/ = ""<CR>
" Combine multi blank lines into one with no highlight
nmap <leader>ll :g/^$/,/./-j<CR><F4><CR>

set incsearch
set ignorecase
set smartcase
set autoindent
set pastetoggle=<F6>
set grepprg=ag

syntax enable
set background=dark
colorscheme solarized
" colorscheme desert

let g:solarized_termcolors=256
nnoremap <silent> <leader>2 :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_autoshowtag = 1
let NERDTreeWinPos = 1

let tags = "./tags"
nnoremap <silent> <leader><tab> :NERDTreeToggle<CR>
nnoremap <F3> :CtrlPSmartTabs<CR>
" instead of commandT buffer windows
nnoremap <leader>b :CtrlPBuffer<CR>
" search from buffer. a little different from CtrlPBuffer
nnoremap <leader>tb :CommandTBuffer<CR>

" Q: Closes the window
nnoremap Q :q<cr>
" close all windows
nnoremap <leader>Q :qa!<cr>

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" jedi-vim
" let g:jedi#completions_command = "<C-N>"

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

if has("autocmd")
  filetype on
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType cc setlocal ts=2 sts=2 sw=2 et
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2 et
  autocmd FileType c setlocal ts=4 sts=4 sw=4 et
  autocmd FileType shell setlocal ts=4 sts=4 sw=4 et
  autocmd FileType java setlocal ts=4 sts=4 sw=4 et
  autocmd FileType php setlocal ts=4 sts=4 sw=4 et
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
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips"]
nnoremap <F2> :UltiSnipsEdit<CR>
" let g:ultisnips_python_style = "GOOGLE"
"

" copy
set clipboard+=unnamed

" easy move between tabs
map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>

" easy move around windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
set timeoutlen=500

" sort
vnoremap <leader>s :sort<cr>

" easy move code blocks
vnoremap < <gv 
vnoremap > >gv 

" command-T
let g:CommandTCancelMap='<c-c>'

" ctrl+k ctrl+l dictionary completion
set dictionary+=/usr/share/dict/words

nnoremap <c-e> 3<c-e>
nnoremap <c-y> 3<c-y>


" pairs. Don't use because of auto-pair plugin
" inoremap <leader>" ""<ESC>i
" inoremap <leader>' ''<ESC>i
" inoremap <leader>[ []<ESC>i
" inoremap <leader>( ()<ESC>i

" set list listchars=tab:»·,trail:·,extends:>,precedes:<,eol:¬

" set cursorcolumn
set cursorline

" set foldmethod=indent

" clang-format
let g:clang_format = "google"
" let g:clang_format#style_options = {
" \ "AccessModifierOffset" : -4,
" \ "AllowShortIfStatementsOnASingleLine" : "true",
" \ "AlwaysBreakTemplateDeclarations" : "true",
" \ "Standard" : "C++11"}
" map to <Leader>cf in C++ code
autocmd FileType c,cc,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cc,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" end clang-format
" other language autoformat
" for html/js/css
autocmd FileType javascript noremap <buffer>  <Leader>cf :call JsBeautify()<CR>
" for html
autocmd FileType html noremap <buffer> <Leader>cf :call HtmlBeautify()<CR>
" for css or scss
autocmd FileType css noremap <buffer> <Leader>cf :call CSSBeautify()<CR>
" for python
autocmd FileType python noremap <buffer><Leader>cf :Autoformat<CR><CR>
"

set backspace=indent,eol,start

" Special case: When the cursor is in a word, "cw" and "cW" do not include the
" white space after a word, they only change up to the end of the word.  This is
" because Vim interprets "cw" as change-word, and a word does not include the
" following white space.
" {Vi: "cw" when on a blank followed by other blanks changes only the first
" blank; this is probably a bug, because "dw" deletes all the blanks; use the
" 'w' flag in 'cpoptions' to make it work like Vi anyway}
map cw dwi

" vim-airline
set t_Co=256
set laststatus=2 " show statusline all time
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t' " only show buffer name
let g:airline_theme = "dark"

"
"inoremap maps a key combination for insert mode
"<C-e> is the keybinding I am creating.
"<C-o> is a command that switches vim to normal mode for one command.
"$ jumps to the end of the line and we are switched back to insert mode.
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" Navigating in Command Mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Don't update the display while executing macros! speed up! Oh~Oh~
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Edit and Source vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" for Ag quickly jump to the next result
noremap <F7> <C-W><C-B>j<CR>
noremap <F8> <C-W><C-B>k<CR>
map <leader>A :Ag <cr>

" vim-ansible-yaml
"
let g:ansible_options = {'ignore_blank_lines': 0}

" When you forgot to open vim with sudo, use w!!
cmap w!! w !sudo tee > /dev/null %

" gui font
set gfn=Monaco:h18

" vim-livedown start
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337
nmap <leader>md :LivedownPreview<CR>
" vim-livedown end

nnoremap <leader>tf :TableFormat<CR>

" cscope mappings and settings
let g:cscope_silent = 1
" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>
" cscope mappings and settings end
