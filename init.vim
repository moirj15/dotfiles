let g:python3_host_prog='/usr/local/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jonathanfilip/vim-lucius'
Plug 'scrooloose/nerdTree'
Plug 'tikhomirov/vim-glsl'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'lambdalisue/vim-fullscreen'
Plug 'chandlerc/jellybeans.vim'
""Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/csapprox'
Plug 'bfrg/vim-cpp-modern'
Plug 'CreaturePhil/vim-handmade-hero'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tomasiser/vim-code-dark'
Plug 'mg979/vim-studio-dark'
""Plug 'rhysd/vim-clang-format'
""Plug 'kana/vim-operator-user'
Plug 'arakashic/chromatica.nvim'
call plug#end()

set termguicolors
set background=dark
hi Normal ctermbg=none
colorscheme jellybeans 
"colorscheme handmade-hero
""colorscheme codedark
""colorscheme vsdark
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
"autocmd Filetype cpp setlocal tabstop=4
set number
set colorcolumn=80
highlight ColorColumn guibg=#2d2d2d ctermbg=4

let NERDTreeIgnor = ['\.o']
let g:NERDTreeWinSize=14
set fillchars+=vert:\$

let g:ale_set_highlights = 1
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1
let g:ale_cpp_clang_options='-std=c++17 -Wall -Wextra -pedantic -Wno-missing-braces'
let g:ale_cpp_gcc_options='-std=c++17 -Wall -Wextra -pedantic -Wno-missing-braces'
let g:ale_c_gcc_options='-std=c11 -Wall -Wextra -pedantic -Wno-missing-braces'

set hidden
let g:deoplete#enable_at_startup=1

autocmd Filetype rust setlocal colorcolumn=99
""let g:cpp_class_scope_highlight = 1
""let g:cpp_member_variable_highlight = 1
""let g:cpp_class_decl_highlight = 1
""
""let g:cpp_no_function_highlight = 1
set mouse=a

cmap wq w
set cino=N-s
""let g:clang_format#style_options = {
"            \ "AccessModifierOffset" : -4,
"            \ "AlignOperands" : "true",
"            \ "BreakConstructorInitializers" : "AfterColon",
"            \ "FixNamespaceComments" : "true",
"            \ "IndentCaseLabels" : "false",
"            \ "IndentWidth" : 4,
"            \ "KeepEmptyLinesAtTheStartOfBlocks" : "false",
"            \ "NamespaceIndentation" : "None",
"            \ "PointerAlignment" : "Right",
"            \ "UseTab" : "Never",
"            \ "AlignAfterOpenBracket" : "Align", 
"            \ "Standard" : "C++11"}
""let g:clang_format#auto_format=1
""autocmd FileType cpp ClangFormatAutoEnable

"let g:chromatica#libclang_path='/usr/local/Cellar/llvm/7.0.1/lib'
"let g:chromatica#enable_at_startup=1





