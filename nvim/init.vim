let mapleader = " "

" # Plugins
call plug#begin('~/.vim/plug')

" ## NCM - Completion Manager
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

        " NOTE: you need to install completion sources to get completions. Check
        "   our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
        Plug 'ncm2/ncm2-bufword'
        Plug 'ncm2/ncm2-path'

        " enable ncm2 for all buffers
        autocmd BufEnter * call ncm2#enable_for_buffer()

        " IMPORTANT: :help Ncm2PopupOpen for more information
        set completeopt=noinsert,menuone,noselect

        " When the <Enter> key is pressed while the popup menu is visible, it only
        " hides the menu. Use this mapping to close the menu and also start a new
        " line.
        inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

        " Use <TAB> to select the popup menu:
        inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ## Hard mode
Plug 'takac/vim-hardtime' 
        let g:hardtime_default_on = 1

" ## Language Client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

        let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ }

        " ## Automatically start language servers.
        let g:LanguageClient_autoStart = 1

" ## Syntax Support
"  - Rust
Plug 'rust-lang/rust.vim'
"  - Many
Plug 'sheerun/vim-polyglot'

" ## Theming
Plug 'joshdick/onedark.vim' " One Dark - use with 'colorsceme onedark'

" ## lightline
Plug 'itchyny/lightline.vim'

call plug#end()

" # Visual

" ## Set color mode to 24-bit

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors

  set background=dark
  set t_Co=256
endif

syntax enable
colorscheme onedark
set number relativenumber

" ## lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'separator':    { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }
set noshowmode " Hide default -- INSERT -- line

" # Vim configuration
set hidden         " Allow multiple buffers open at once
set expandtab      " <TAB> inserts spaces, not \t
set softtabstop=4  " <TAB> inserts 4 spaces
set number         " show line numbers
set cursorline     " highlight current line
set wildmenu       " visual autocomplete for command menu
filetype indent on " load filetype-specific indent files
set showcmd        " show leader cmd

" ## Search
set incsearch      " search as characters are entered
set nohls          " no search highlight
set ignorecase

" ## Undo
set undofile " Maintain undo history between sessions
set undodir=~/.vimdid

" ## Folds
set foldmethod=syntax " Fold according to lang rules

" ## Views (remember folds, cursor position across sessions)
set viewoptions-=options                  " Don't include cwd in view
autocmd BufWinLeave *.* mkview            " Create a view when leaving a buffer
autocmd BufWinEnter *.* silent loadview   " Load the view when entering a buffer


" ## Navigation
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>

nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>

nnoremap <SPACE> <Nop>

" ## Other
inoremap jj <ESC> " use jj to switch to Normal from Insert

" ## Verbs
nnoremap Y y$

" # Filetype Association
autocmd BufReadPost *.rs setlocal filetype=rust

" # Language Client configuration

" # Keybinds

" ## Language Client:
"  -  Maps F5 to ctx menu
"  -  Maps K to hover
"  -  gd to goto definition
"  -  F2 to rename
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
