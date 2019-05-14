" Michael Claybaugh's vimrc
" To use with vim, copy contents to ~/.vimrc
" To use this with neovim, copy the contents to ~/.config/nvim/init.vim

"*************************************************
"* 0. Settings and keybindings
"*************************************************
set tabstop=2 shiftwidth=2 expandtab
set number
"set relativenumber
set incsearch hlsearch    " not needed in neovim as they are ON by default
set list
set listchars=tab:\|\ ,space:·
set cursorline      " Highlight current line
set hidden           " allow modified buffers to be hidden
set diffopt+=vertical
" more natual split opening
set splitbelow
set splitright
set ignorecase
set smartcase
set scrolloff=3
set visualbell

"***************************************************
"* 1. vim-plug
"***************************************************
call plug#begin()

" Functional plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'lervag/vimtex'

" Syntax plugins
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'ErichDonGubler/vim-sublime-monokai'
"Plug 'dikiaap/minimalist'
"Plug 'chriskempson/base16-vim'
"Plug 'mhartington/oceanic-next'

call plug#end()

"****************************************************
"* 2. Colorscheme
"****************************************************

" sublimemonokai stuff
if (has("termguicolors"))
    set termguicolors
endif
"let g:sublime_monokai_term = 1

" gruvbox stuff
set background=dark
colorscheme gruvbox

"*****************************************************
"* 3. Airline
"*****************************************************

"let g:airline_powerline_fonts = 1
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" enable list of buffers
" joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

"*****************************************************
"* 4. Ale
"*****************************************************
"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

"*****************************************************
"* 5. mappings
"*****************************************************


"Changing buffers
nnoremap <m--> :bn<CR>

"navigating windows
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-h> :wincmd h<CR>

" resizing windows
nnoremap <m-k> :resize +5<CR>
nnoremap <m-l> :vertical resize -5<CR>
nnoremap <m-h> :vertical resize +5<CR>
nnoremap <m-j> :resize -5<CR>

" rotate kindows (move them)
nnoremap <m-r> <C-w>R

"shortcut to un-highlight search terms
nnoremap <Space><Space> :nohlsearch<CR>

"escaping terminal with Esc
tnoremap <Esc> <C-\><C-n>

" Spell checking
nmap <f5> :setlocal spell spelllang=en_us <CR>
nmap <f6> :set nospell <CR>

map <C-n> :NERDTreeToggle<CR>
let mapleader=" "
"fzf
nmap <leader>f :Files<CR>
nmap <leader>t :Tags<CR>
nmap <leader>h :History<CR>
nmap <leader>m :Maps<CR>
nmap <leader>c :Colors<CR>
"ale
nmap <leader>j :ALENext<CR>
nmap <leader>k :ALEPrevious<CR>
" takeout windows line endings
nmap <leader>fl :%s///g<CR>
nmap <leader>fi gg=G
