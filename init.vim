"let g:python3_host_prog='/usr/local/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jonathanfilip/vim-lucius'
Plug 'scrooloose/nerdTree'
Plug 'tikhomirov/vim-glsl'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
"Plug 'w0rp/ale'
Plug 'lambdalisue/vim-fullscreen'
Plug 'chandlerc/jellybeans.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/csapprox'
Plug 'bfrg/vim-cpp-modern'
Plug 'CreaturePhil/vim-handmade-hero'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tomasiser/vim-code-dark'
Plug 'mg979/vim-studio-dark'
Plug 'rhysd/vim-clang-format'
""Plug 'kana/vim-operator-user'
Plug 'arakashic/chromatica.nvim'
Plug 'JesseKPhillips/d.vim'
Plug 'vim-scripts/Dutyl'
Plug 'scarface-one/vim-dlang-phobos-highlighter'
"Plug 'vim-scripts/User-Defined-Type-Highlighter'
Plug 'neoclide/coc.nvim',  {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'Yohannfra/Vim-Goto-Header'
Plug 'ap/vim-buftabline'
call plug#end()

set termguicolors
set background=dark
hi Normal ctermbg=none
colorscheme gruvbox 
"colorscheme handmade-hero
""colorscheme codedark
""colorscheme vsdark
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
"autocmd Filetype cpp setlocal tabstop=4
set number
set colorcolumn=120
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
let g:clang_format#detect_style_file = 1
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
let g:clang_format#auto_format=1
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType c ClangFormatAutoEnable

"let g:chromatica#libclang_path='/usr/local/Cellar/llvm/7.0.1/lib'
"let g:chromatica#enable_at_startup=1
"

let g:udt_recursive = 1

"au bufreadpost *.cpp,*.c,*.h call Generate_Highlighting()

"language server stuff
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:syntastic_cpp_checkerse = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set cmdheight=2
set updatetime=300
"set shortmess += c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" nvim-qt
set guifont=Fira\ Mono:h16"\ Regular


" termianl stuff
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

" switch to header/source file
nnoremap <F4> :GotoHeaderSwitch <CR>

" buffer tab line
nnoremap <C-N> :bnext <CR>
nnoremap <C-P> :bprev <CR>
