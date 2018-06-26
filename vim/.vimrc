" Pathogen
execute pathogen#infect()

"" NerdTREE
map <F2> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
" autocmd vimenter * NERDTree     " Automatically open NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ctrl P ignore .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0

" Vim tagbar
nmap <F8> :TagbarToggle<CR>

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" vsplit
noremap <leader>v :vsplit<CR>

" Colors
syntax enable
set t_Co=256

" Vim Airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Make separators fancy
let g:airline_powerline_fonts = 1

" Buffergator
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1
" Looper buffers
"let g:buffergator_mru_cycle_loop = 1
" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>
" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" Open a new empty buffer
noremap <leader>t :enew<CR>
" Close the current buffer and move to the previous one
noremap <leader>bq :bp <BAR> bd #<CR>

" Set colorscheme
colorscheme solarized
set background=dark

" Spaces and Tabs
set tabstop=2               " number of visual spaces per TAB
set softtabstop=2           " number of spaces in tab when editing
set shiftwidth=2            " number of spaces for autoindentation
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
set expandtab               " tabs are spaces

" UI Config
filetype plugin indent on   " load filetype-specific indent files
set backspace=indent,eol,start " Fix backspace
set ruler
set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
hi CursorLine ctermbg=black
"hi CursorLine cterm=None ctermbg=black ctermfg=None guibg=None
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to.
set showmatch               " highlight matching [{()}]

" Latex
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
:helptags ~/.vim/bundle/vim-latex/doc/

" Searching
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
" turn off search highlight
nnoremap <esc><esc> :noh<return><esc>

" Folding
set foldenable              " enable folding
set foldlevelstart=10       " open most folds by default
set foldnestmax=10          " 10 nested fold max
set foldmethod=indent       " fold based on indent level
" space open/closes folds
nnoremap <space> za
