" Michael Claybaugh's vimrc
" General stuff 
colorscheme desert
set tabstop=3
syntax on
set number
set incsearch
filetype plugin on

" increasing or decreasing line indents
map .<Tab> I<Tab><Esc>

" Drew inspiration for navigation and html bindings from Luke Smith, see
" github: https://github.com/LukeSmithxyz
" ***Adjusted his work to fit my liking

" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

" HTML specific bindings
autocmd FileType php,html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType php,html inoremap ;h1 <h1></h1><Enter><++><Esc>kf<i
autocmd FileType php,html inoremap ;h2 <h2></h2><Enter><++><Esc>kf<i
autocmd FileType php,html inoremap ;h3 <h3></h3><Enter><++><Esc>kf<i
autocmd FileType php,html inoremap ;p <p></p><Enter><++><Esc>ki
"autocmd FileType php,html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType php,html inoremap ;a <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType php,html inoremap ;ul <ul><Enter><Tab><li></li><Enter></ul><Enter><++><Esc>2kf>a
autocmd FileType php,html inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType php,html inoremap ;ol <ol><Enter><Tab><li></li><Enter></ol><Enter><++><Esc>2kf>a

