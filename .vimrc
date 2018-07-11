" Michael Claybaugh's vimrc
" To use with vim, copy contents to ~/.vimrc
" To use this with neovim, copy the contents to ~/.config/nvim/init.vim

"*************************************************
"* 0. general settings
"*************************************************
set tabstop=4
set shiftwidth=4
set number
set incsearch hlsearch           " not needed in neovim as they are ON by default
set list
set listchars=tab:\|\ 
" Show tabs visually as >--
set cursorline                   " Highlight current line
set hidden                       " allow modified buffers to be hidden

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
" Colorschemes
Plug 'morhetz/gruvbox' 
Plug 'dikiaap/minimalist'
"Plug 'chriskempson/base16-vim'
"Plug 'mhartington/oceanic-next'
Plug 'ErichDonGubler/vim-sublime-monokai'
call plug#end()

" Following recommended for Oceanic Next colorscheme
"if (has("termguicolors"))
"	set termguicolors
"endif

"****************************************************
"* 2. Colorscheme
"****************************************************
"set background=dark " use this for gruvbox
"colorscheme gruvbox

"set t_Co=256 " this is recommended for minimalist colorscheme
"colorscheme minimalist

" sublimemonokai stuff
set termguicolors
let g:sublime_monokai_term = 1
colorscheme sublimemonokai
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
" Show buffer numbers
let g:airline#extensions#tabline#buffer_idx_mode = 1

"*****************************************************
"* 4. NERDTree
"*****************************************************
map <C-n> :NERDTreeToggle<CR>

"*****************************************************
"* 4. Other keybindings
"*****************************************************
"Changing buffers
nnoremap <m--> :bn<CR>

"escaping terminal with Esc
tnoremap <Esc> <C-\><C-n>

" Drew inspiration for navigation and html bindings from Luke Smith, see
" github: https://github.com/LukeSmithxyz
" Navigating with guides
inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
map <Tab><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

" HTML specific bindings
inoremap ;b <b></b><Space><++><Esc>FbT>i
inoremap ;i <em></em><Space><++><Esc>FeT>i
inoremap ;h1 <h1></h1><Enter><++><Esc>kf<i
inoremap ;h2 <h2></h2><Enter><++><Esc>kf<i
inoremap ;h3 <h3></h3><Enter><++><Esc>kf<i
inoremap ;p <p></p><Enter><++><Esc>ki
inoremap ;a <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
inoremap ;ul <ul><Enter><Tab><li></li><Enter></ul><Enter><++><Esc>2kf>a
inoremap ;li <Esc>o<li></li><Esc>F>a
inoremap ;ol <ol><Enter><Tab><li></li><Enter></ol><Enter><++><Esc>2kf>a


