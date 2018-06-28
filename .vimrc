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
set listchars=tab:>-             " Show tabs visually as ">--"
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
"Plug 'mhartington/oceanic-next'
call plug#end()

" Following recommended for Oceanic Next colorscheme
"if (has("termguicolors"))
"	set termguicolors
"endif

"****************************************************
"* 2. Colorscheme
"****************************************************
set background=dark
colorscheme gruvbox
"let g:airline_theme='base16'

"*****************************************************
"* 4. NERDTree
"*****************************************************
map <C-n> :NERDTreeToggle<CR>

" ----Airline
" enable list of buffers
" joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
let g:airline#extensions#tabline#enabled = 1
" show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

"*****************************************************
"* 4. Other keybindings
"*****************************************************
"Changing buffers
nnoremap <m--> :bn<CR>
nnoremap <m-1> :1b<CR>
nnoremap <m-2> :2b<CR>
nnoremap <m-3> :3b<CR>
nnoremap <m-4> :4b<CR>
nnoremap <m-5> :5b<CR>
nnoremap <m-6> :6b<CR>
nnoremap <m-7> :7b<CR>
nnoremap <m-8> :8b<CR>
nnoremap <m-9> :9b<CR>
nnoremap <m-0> :10b<CR>

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


