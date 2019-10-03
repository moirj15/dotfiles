
call plug#begin('~/.vim/pluged')
Plug 'jonathanfilip/vim-lucius'
Plug 'scrooloose/nerdTree'
Plug 'tikhomirov/vim-glsl'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'lambdalisue/vim-fullscreen'
Plug 'chandlerc/jellybeans.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/csapprox'
Plug 'bfrg/vim-cpp-modern'
Plug 'CreaturePhil/vim-handmade-hero'
Plug 'racer-rust/vim-racer'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

"set termguicolors
set background=dark
hi Normal ctermbg=none
"colorscheme jellybeans 
colorscheme gruvbox
"colorscheme handmade-hero
set autoindent
set tabstop=4
set smartindent
set shiftwidth=4
set expandtab
set softtabstop=4
autocmd Filetype cpp setlocal tabstop=4
set number
set colorcolumn=80
highlight ColorColumn guibg=#2d2d2d ctermbg=4

let NERDTreeIgnor = ['\.o']
let g:NERDTreeWinSize=14
set fillchars+=vert:\$

let g:ale_set_highlights = 1
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1
let g:ale_cpp_gcc_options='-std=c++17 -Wall -Wextra -pedantic'

set hidden
let g:racer_cmd = "/home/moirj15/.cargo/bin/racer"
let g:deoplete#enable_at_startup=1
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd Filetype rust setlocal colorcolumn=99
autocmd Filetype cpp setlocal colorcolumn=100

"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1

"let g:cpp_no_function_highlight = 0
set mouse=a

cmap wq w

packadd termdebug

set cino=N-s
set cinoptions=+0
