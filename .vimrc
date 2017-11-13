" Start up vim {{{1 

" Use Vim settings, rather than Vi settings (much better)
                 " This must be first because it changes other options as a
                 " side effect.

set nocompatible 
call pathogen#infect() " Using pathogen to infect plugins
call pathogen#helptags()
syntax enable
filetype plugin indent on


"set shell=bash          " Vim expects a POSIX-compliant shell
colorscheme desert " not used 'pablo'
highlight normal guibg=Black guifg=White
" Not used {{{1
"let xml_syntax_folding=1

" System {{{1
set clipboard=unnamed "Operations such as yy, D, and P work with the system clipboard. 
                      "No need to prefix them with + or * 
                      "This will make copy and paste to use windows clipboard
set guioptions+=b     "Enable horizontal scroll bar 
set mouse=a           " Enable using mouse if terminal emulator supports.
                      " xterm does supports.
                      " On OSx press ALT and click   
"set ttyfast       " always use a fast terminal


" Vim behavior {{{1 
" Vim Buffer {{{2
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
" Vim History and Undo {{{2
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif

" Vim Encoding {{{2
set termencoding=utf-8
set encoding=utf-8

" Vim Display {{{2
set lazyredraw     " don't update the display while executing macros
set showcmd        " Show (partial) command in the last line of the screen
                   "   this also shows visual selection info
set ruler          " Show the cursor position all the time
set list           " Display whitespace
set number         " Display line numbering
set cmdheight=2    " Use a status bar that is 2 rows high
set laststatus=2   " Display the status line always. See :help laststatus
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%#ErrorMsg#%{GitBranchInfoString()}%#StatusLine#
"set statusline+=%{GitBranchInfoString()}

"Better navigating through omnicomplete option list 
"http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=menuone,menu,longest,preview

set cursorline     " Underline the current line, for quick orientation
set nomodeline     " Disable mode lines (security measure)
set visualbell     " Don't beep
set noerrorbells   " Don't beep

"Vim Search setting {{{2
set incsearch         " Do incremental searching => Search as characters are entered
set ic                " Ignore case for search
set scs               " Smart search on (for case-sensitive)
set hlsearch          " Highlight all occurance of a search


"Vim Automatic backup {{{2
" Stop vim from creating backup files
set nobackup      " do not keep a backup file 
set nowb          " no write back 
set noswapfile    " no swap files
set directory=~/.vim/.tmp,~/tmp,/tmp
                  " store swap files in one of these directories
                  "    (in case swapfile is ever turned on)

"Vim wild menu  {{{2
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
"Do not tab complete binary files
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.svn,.git,.hg
set wildignore+=*~,*.swp,*.tmp

" Options {{{1
" Font {{{2
"set guifont=Courier\ 30
"set guifont=Monospace\ 20


" Fold {{{1
" Fold Option {{{2
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold

" Fold mappings to easily toggle fold levels {{{2
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>

nnoremap <Space> za
vnoremap <Space> za

"au GUIEnter * simalt ~x
"set textwidth=109  " This is ensure our lines are only 109 chars long (max).

" Style Formatting  {{{1
" Default space setting {{{2
set shiftwidth=4   " 1tab 
set tabstop=4      " Set number of spaces for a tab 
set expandtab      " Change tabs to spaces 
set listchars=eol:.,tab:+-,trail:-,extends:>,precedes:<  "Display for whitespace
set backspace=indent,eol,start "Allows backspacing over everything insert mode. 

" Indenting {{{2
set ai     "Auto indent
set si     "Smart indent
set nowrap "Do not wrap lines

" Matching pairs {{{2 
set showmatch       " reduce the need for %, the cursor will briefly jump to the matching braches when you insert one
set matchpairs+=<:> " To add angle brackets if they aren't jumped when using %
                    " :help various-motions  and :help matchpairs - % for more
                    " details

" File {{{1
set fileformats=unix,dos
set autoread                " Atomatically reload files changed outside of Vim

" Crap {{{2
" set autochdir   " This will make the cur dir of vim to match the dir of the file that is currently open.
"set mousefocus  " Focus-follows mouse inside vim.

" gui_running {{{1
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch     "highlight matches
endif


" Clone Paragraph with cp 
" This will copy the paragraph your cursor is on, 
" then paste a copy of it just below it. 
" noremap cp yap<S-}>p

" nnoremap {{{1 
" <F5> Search keyword under cursor in current directory{{{2
nnoremap <F5> :grep <C-R><C-W> *<CR> 

" <Shift> + <Direction> To change tabs {{{2
" Mapping for vim command :gt and :gT

" <Shift> + <[l|Right]> Move to next right tab 
nnoremap <S-l> gt
nnoremap <S-Right> gt

" <Shift> + <[l|Left]> Move to next left tab 
nnoremap <S-h> gT
nnoremap <S-Left> gT

" Map window movement commands
nnoremap <C-k> <C-w><Up>
nnoremap <C-j> <C-w><Down>
nnoremap <C-l> <C-w><Right>
nnoremap <C-h> <C-w><Left>

" Plugin configuration {{{1
" vim-Pandoc {{{2
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#folding#level = 999


" NERDTree {{{ 2
" Open a NERDTree automatically
" when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim when NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree with Ctrl+n:
map <C-n> :NERDTreeToggle<CR>

" vim-notes {{{2
" plugin-source: https://github.com/xolox/vim-notes
" plugin-source: https://github.com/xolox/vim-misc
let g:notes_suffix = '.txt' 
let g:notes_directories = [ '~/Notes', '~/Dropbox/Shared Notes']
let g:notes_markdown_program='~/homebrew/bin/markdown'

autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown
" Vim Airline Section {{{2
" plugin-source: https://github.com/vim-airline/vim-airline
let g:airline_detect_paste=1     " Enable paste detection 
let g:airline_detect_modified=1  " Enable modified detection
let g:airline_detect_spell=1     " Enable spell detection

" Bdelete {{{2
" plugin-source: https://github.com/moll/vim-bbye
nnoremap <Leader>q :Bdelete<CR>

" NerdCommenter {{{2
" plugin-source https://github.com/scrooloose/nerdcommenter

let g:NERDSpaceDelims = 1              " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1          " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'        " Align line-wise comment delimiters flush left 
                                       " instead of following code indentation
let g:NERDAltDelims_java = 1           " Set a language to use its alternate delimiters by default

let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } 
                                       " Add your own custom formats or override the defaults

let g:NERDCommentEmptyLines = 1        " Allow commenting and inverting empty lines 
                                       " (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1  

" Syntastic {{{2
" plugin-description: Syntastic is a syntax checking plugin for Vim
" plugin-source: https://github.com/vim-syntastic/syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Html5 {{{2 
" plugin-description: HTML5 omnicomplete funtion and syntax for Vim.
" plugin-source: https://github.com/othree/html5.vim

let g:html5_event_handler_attributes_complete = 0  " Disable event-handler attributes support:
let g:html5_rdfa_attributes_complete = 0           " Disable RDFa attributes support:
let g:html5_microdata_attributes_complete = 0      " Disable microdata attributes support:
let g:html5_aria_attributes_complete = 0           "Disable WAI-ARIA attribute support:

"Python mode {{{2
" plugin-description: Python mode for development
" plugin-source: https://github.com/klen/python-mode

"Activate rope {{{3
"================  ============================
"Key               Command
"================  ============================
" K                 Show Python docs
" <Ctrl-Space>      Rope autocomplete 
" <Ctrl-c>g         Rope goto definition
" <Ctrl-c>d         Rope show documentation
" <Ctrl-c>f         Rope find occurances
" <Leader>b         Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[                Jump to previous class or function (normal, visual, operator modes)
" ]]                Jump to next class or function  (normal, visual, operator modes)
" [M                Jump to previous class or method (normal, visual, operator modes)
" ]M                Jump to next class or method (normal, visual, operator modes)
" aC                Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC                Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM                Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM                Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
"================  ============================
" Python mode settings {{{3
let ropevim_enable_shortcuts = 1
let g:pymode = 1

" Documentation 
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting 
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv 
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<Leader>b'

"syntax highlighting 
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"Don't autofold code
let g:pymode_folding = 0

let g:pymode_rope_extended_complete = 1
"map <Leader>b import pdb.set_trace() # XXX BREAKPOINT<C-c>

" Minibuf explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplModSelTarget = 1


" autocommand {{{1
" Execute python script {{{2
autocmd! FileType python nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<CR>
augroup filetypes " {{{2
    au!
    au BufNewFile,BufRead,BufWrite todo.txt setl ft=todotxt
    au BufNewFile,BufRead,BufWrite *.csv setl ft=csv
    au BufNewFile,BufRead,BufWrite *.ejs setl ft=html
    au FileType ruby    setl sw=2 makeprg=ruby\ % efm=
                \%+E%f:%l:\ parse\ error,
                \%W%f:%l:\ warning:\ %m,
                \%E%f:%l:in\ %*[^:]:\ %m,
                \%E%f:%l:\ %m,
                \%-C%\tfrom\ %f:%l:in\ %.%#,
                \%-Z%\tfrom\ %f:%l,
                \%-Z%p^,
                \%-G%.%#
    au FileType ruby    nnoremap <leader>p Yp^Cbinding.pry<Esc>
    au FileType ruby    set makeprg=clear;\ bundle\ exec\ rake
    au FileType python  setl sw=4 makeprg=python\ % efm=
                \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
                \%C\ \ \ \ %.%#,
                \%+Z%.%#Error\:\ %.%#,
                \%A\ \ File\ \"%f\"\\\,\ line\ %l,
                \%+C\ \ %.%#,
                \%-C%p^,
                \%Z%m,
                \%-G%.%#
    au FileType python  nnoremap <leader>p Yp^Cinteract()<Esc>
    au FileType xml     set equalprg=xmllint\ --format\ --recover\ -
    au FileType mail    let mapleader = "\\" | let maplocalleader = "," | setl spell fo=wantq1 smc=0
    au FileType cpp     set makeprg=g++\ \-lpcrecpp\ %\ &&\ ./a.out
    au FileType haskell set nocul cocu=in makeprg=ghc\ %
    au FileType pandoc  set makeprg=pandoc\ \-o\ output.pdf\ %
augroup end
"augroup filetype
"        au!
"        au! BufRead,BufNewFile *.apg    set filetype=cpp
"        au! BufRead,BufNewFile *.wiki   set filetype=html
"augroup END


" has autocmd {{{2
" Only do this part when compiled with support for autocommands .
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")
" Leader {{{1
let mapleader = ","
" <leader>m Match brace {{{2
nnoremap<Leader>m :%<CR> 
" <leader>wq Write and Quit File {{{2
nnoremap<Leader>wq :wq<CR>
" <leader>w Write file {{{2
nnoremap<Leader>w :w<CR>
" <leader>qa Quit all files {{{2
nnoremap<Leader>qa :qall!<CR>
" <leader>qc Quit current file {{{2
nnoremap<Leader>qc :q!<CR>
" <leader>evrc to edit vimrc file {{{2
nnoremap <leader>evrc :vsp $MY_VIMRC<CR>
" <leader>evrc to edit vimrc file {{{2
nnoremap <leader>ebrc :vsp $MY_BASHRC<CR>
" <leader>g grep -i -r 
noremap <leader>g :silent execute "grep! -i -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" <F[1-12]> keys {{{1 
"<F1> pastes in insert/normal mode. {{{2
" The nopaste setting makes sure that auto-indent doesn't go crazy 
" when you try to paste something in
nmap <F1> :set paste <CR>:r !pbpaste<CR>:set nopaste<CR> 
imap <F1> <Esc>: set paste <CR>:r !pbpaste<CR>:set nopaste<CR>

"<F2> copies text in normal mode, it will copy current line. 

nmap <F2> :.w !pbcopy<CR><CR> 
" If you are in visual mode, however, it will grab all the
"select text. 
vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy". @") \| let @"=@a<CR>



" <F3> open fold {{{2
nnoremap <silent> <F3> :zo<CR>
" <F4> close fold {{{2
nnoremap <silent> <F4> :zc<CR>

" <F9> grep -i {{{2 
"nnoremap <silent> <F9> :execute "grep -i " . shellescape(expand("<cword>")) . " ./"<CR> :execute 'copen'<CR>
" <F10> grep -i path  
nnoremap <silent> <F10> :execute "grep -i " . shellescape(expand("<cword>")) . " pattern/*.apg c1dfiles/*.c1d . source/*.cc . source/*.h . scripts"<CR> :execute 'copen'<CR>
" This is to fold the job_control.xml file and show only the relevant info
nnoremap <silent> <F11> :set foldmethod=indent<CR><Esc>zMzrzr<Esc>:set foldmethod=manual<CR>gg32jzo7jzo
"nnoremap <silent> <F8> :!make tags<CR>
"nnoremap <silent> <F2> :windo diffthis<CR>
"nnoremap <silent> <F3> :windo diffoff <CR>

"<Shift-Enter> <o><Esc> to add new line 
nmap <S-Enter> o<CR>

let TList_Auto_Highlight_Tag=0

"map <F10> <Esc>:exec("Grep -i ".expand("<cword>"))<CR>
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-\> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR><C-W>r
map cn <Esc>:cn<CR>
map cp <Esc>:cp<CR>

noremap % v%

:iabbrev </ </<C-X><C-O>
" not used mapping {{{1


" Virtual Environment {{{1
" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif
"" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
"function LoadVirtualEnv(path)
"    let activate_this = a:path . '/bin/activate_this.py'
"    if getftype(a:path) == "dir" && filereadable(activate_this)
"        python << EOF
"import vim
"activate_this = vim.eval('l:activate_this')
"execfile(activate_this, dict(__file__=activate_this))
"EOF
"    endif
"endfunction


" OmniCppComplete {{{1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>

" }}} vim: fdm=marker 
