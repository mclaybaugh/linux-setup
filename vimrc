" Michael Claybaugh's vimrc
" To use with vim, copy contents to ~/.vimrc
" To use this with neovim, copy the contents to ~/.config/nvim/init.vim

"*************************************************
"* 0. general settings
"*************************************************
set tabstop=2
set shiftwidth=2
set number
set incsearch hlsearch    " not needed in neovim as they are ON by default
set list 
set listchars=tab:\|\ ,space:·
" Show tabs visually as |
set cursorline      " Highlight current line
set hidden           " allow modified buffers to be hidden

" http://vim.wikia.com/wiki/Avoid_the_escape_key
" For avoiding the escape key, will try C-[ and the various Alt commands
" and see how that goes

" Increase and decrease indents with >> and <<

"***************************************************
"* 1. vim-plug 
"***************************************************
call plug#begin()
" Functional plugins
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
"Plug 'Yggdroot/indentLine' removed because it makes some markup hidden
Plug 'alvan/vim-closetag'
Plug 'vim-syntastic/syntastic'
"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'
"Plug 'lervag/vimtex'
"Plug 'Valloric/YouCompleteMe' 
" For YouCompleteMe:
" I use C, go, and rust options ( I don't use C# or Java )
" For javascript typescript, ensure that typescript is installed with 
" npm install -g typescript
" ./install.py --clang-completer --go-completer --rust-completer
" Colorschemes
Plug 'morhetz/gruvbox' 
"Plug 'ErichDonGubler/vim-sublime-monokai'
"Plug 'dikiaap/minimalist'
"Plug 'chriskempson/base16-vim'
"Plug 'mhartington/oceanic-next'
call plug#end()


"****************************************************
"* 2. Colorscheme
"****************************************************
"set t_Co=256 " this is recommended for minimalist colorscheme
"colorscheme minimalist

" sublimemonokai stuff
if (has("termguicolors"))
    set termguicolors
endif
"let g:sublime_monokai_term = 1

" gruvbox stuff
set background=dark
colorscheme gruvbox

nnoremap <C-g> :colorscheme gruvbox<CR>:set background=dark<CR>
nnoremap <C-s> :colorscheme sublimemonokai<CR>
"*****************************************************
"* 3. Airline
"*****************************************************

let g:airline_powerline_fonts = 1

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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" enable list of buffers
" joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
"
"*****************************************************
"* 4. NERDTree
"*****************************************************
map <C-n> :NERDTreeToggle<CR>

"*****************************************************
"* 5. indentLine 
"*****************************************************
"NOTE: indentLine turns on conceal feature so depending on syntax some
"   characters are hidden by default. I modified the default conceal cursor
"   from 'inc' to 'nc' so that the hidden characters will show when one is
"   editing the line
"let g:indentLine_setColors = 0
"let g:indentLine_concealcursor = 'nc'

"*****************************************************
"* 6. vim-closetag 
"*****************************************************
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'

" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,php'

"*****************************************************
"* 7. Syntastic
"*****************************************************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"*****************************************************
"* 8. Other keybindings
"*****************************************************
"Changing buffers
nnoremap <m--> :bn<CR>

" more natual split opening
set splitbelow
set splitright

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

" Line number toggling
nnoremap <f3> :set norelativenumber<CR>
nnoremap <f4> :set relativenumber<CR>

" Spell checking
nnoremap <f5> :setlocal spell spelllang=en_us <CR>
nnoremap <f6> :set nospell <CR>

" Syntastic turn off
nnoremap <f7> :SyntasticToggleMode<CR>
