"let g:python3_host_prog='/usr/local/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jonathanfilip/vim-lucius'
Plug 'scrooloose/nerdTree'
Plug 'tikhomirov/vim-glsl'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'lambdalisue/vim-fullscreen'
Plug 'chandlerc/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/csapprox'
Plug 'CreaturePhil/vim-handmade-hero'
Plug 'tomasiser/vim-code-dark'
Plug 'mg979/vim-studio-dark'
Plug 'rhysd/vim-clang-format'
"Plug 'JesseKPhillips/d.vim'
Plug 'vim-scripts/Dutyl'
Plug 'neoclide/coc.nvim',  {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kien/ctrlp.vim'
Plug 'ackyshake/Spacegray.vim'
Plug 'lifepillar/vim-gruvbox8'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'rust-lang/rust.vim'
"Plug 'puremourning/vimspector'
Plug 'skywind3000/asyncrun.vim'
"Plug 'cdelledonne/vim-cmake'
Plug 'airblade/vim-rooter'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'Shatur/neovim-cmake'
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

"Plug 'romgrk/barbar.nvim'
Plug 'tomasr/molokai'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

filetype plugin on
syntax on
set autoread

set termguicolors
set background=dark
hi Normal ctermbg=none
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
"autocmd Filetype cpp setlocal tabstop=4
set number
set colorcolumn=120
highlight ColorColumn guibg=#2d2d2d ctermbg=4

let NERDTreeIgnor = ['\.o']
let g:NERDTreeWinSize=25
set fillchars+=vert:\$

let g:ale_set_highlights = 1
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1
let g:ale_cpp_clang_options='-std=c++2a -Wall -Wextra -pedantic -Wno-missing-braces'
let g:ale_cpp_gcc_options='-std=c++2a -Wall -Wextra -pedantic -Wno-missing-braces'
let g:ale_c_gcc_options='-std=c11 -Wall -Wextra -pedantic -Wno-missing-braces'

set hidden
let g:deoplete#enable_at_startup=1

autocmd Filetype rust setlocal colorcolumn=99
set mouse=a

cmap wq w
set cino=N-s
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format=1
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType c ClangFormatAutoEnable

let g:udt_recursive = 1


"language server stuff
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

set cmdheight=1
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

" termianl stuff
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

" switch to header/source file
nnoremap <F4> :CocCommand clangd.switchSourceHeader <CR>

" buffer tab line
"nnoremap <C-N> :bnext <CR>
"nnoremap <C-P> :bprev <CR>

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|build|include$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:lsp_cxx_hl_light_bg = 1

let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1


colorscheme gruvbox8

if has('nvim')
    lua <<EOF
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      highlight = {
        enable = true,              -- false will disable the whole extension
      },
    }
    require('telescope').setup {
        defaults = {
            file_ignore_patterns = {"^buid/", "^.git/", "%.so"}
        }
    }
EOF
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Leader key stuff
" (mostly copied from https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim)
let mapleader = "\<Space>"

" Quick-save
nmap <leader>w :w<CR>

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gn <Plug>(coc-diagnostic-prev)
nmap <silent> gp <Plug>(coc-diagnostic-next)

set undodir=~/.vimdid
set undofile

let g:floaterm_keymap_toggle = '<Leader>ft'
nnoremap <Leader>ft :FloatermToggle<CR>
nnoremap <Leader>c :CMake build<CR>

nnoremap <Leader>bn :BufferNext<CR>
nnoremap <Leader>bp :BufferPrevious<CR>
nnoremap <Leader>bc :BufferClose<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader><leader> <cmd>Telescope live_grep<cr>

