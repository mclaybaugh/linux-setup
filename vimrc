" Michael Claybaugh's vimrc
" To use with vim, copy contents to ~/.vimrc
" To use this with neovim, copy the contents to ~/.config/nvim/init.vim

"*************************************************
"* 0. general settings
"*************************************************
set tabstop=4 shiftwidth=4 expandtab
set number
set incsearch hlsearch    " not needed in neovim as they are ON by default
set list
set listchars=tab:\|\ 
" Show tabs visually as |
set cursorline      " Highlight current line
set hidden           " allow modified buffers to be hidden
set noshowmatch     " Sometimes the highlighted matching braces caused me confusion

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
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'
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
"set t_Co=256 " this is recommended for minimalist colorscheme
"colorscheme minimalist

" sublimemonokai stuff
if (has("termguicolors"))
    set termguicolors
endif

let g:sublime_monokai_term = 1
colorscheme sublimemonokai

" Following recommended for Oceanic Next colorscheme
"if (has("termguicolors"))
"	set termguicolors
"endif
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
let g:indentLine_setColors = 0
let g:indentLine_concealcursor = 'nc'

"*****************************************************
"* 6. vim-closetag 
"*****************************************************
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'

" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,php'

"*****************************************************
"* 7. Other keybindings
"*****************************************************
"Changing buffers
nnoremap <m--> :bn<CR>

"Navigating windows like buffers
nnoremap <m-0> <C-w>w

"shortcut to un-highlight search terms
nnoremap <Space><Space> :nohlsearch<CR>

"escaping terminal with Esc
tnoremap <Esc> <C-\><C-n>

