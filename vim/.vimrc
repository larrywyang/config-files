" Pathogen
execute pathogen#infect()

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Speed up gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

"" NerdTREE
"autocmd vimenter * NERDTree     " Automatically open NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Ctrl-n to toggle nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" Splits
nnoremap <leader>v :vsplit<CR>

" Ctrl P
"let g:ctrlp_custom_ignore = {
 ""\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
"\}
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" YouCompleteMe for python
"let g:ycm_python_binary_path = 'python'
"let g:ycm_autoclose_preview_window_after_insertion = 1
" Temporarily disable YCM
let g:loaded_youcompleteme = 1

set hidden
" Open ctags in new tab
noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>zz
" Open ctags in vertical split
noremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>zz
" Print ipdb debug line
noremap <leader>db Oimport ipdb; ipdb.set_trace();<ESC>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
" Let g:buffergator_mru_cycle_loop = 1
" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>
" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>
" Shared bindings from Solution #1 from earlier
nmap <leader>t :enew<cr>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<cr>

" Center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zzN
nnoremap # #zz
nnoremap g* g*zzN
nnoremap g# g#zz

" Colors
syntax enable               " enable syntax processing
set t_Co=256
colorscheme solarized
set background=dark

" Spaces and Tabs
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4            " number of spaces for autoindentation
set expandtab               " tabs are spaces

" Toggle paste mode
set pastetoggle=<leader>p

" UI Config
filetype plugin indent on   " load filetype-specific indent files
set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
"hi CursorLine cterm=None ctermbg=16 ctermfg=None guibg=None
hi CursorLine ctermbg=black
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to.
set showmatch               " highlight matching [{()}]

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
