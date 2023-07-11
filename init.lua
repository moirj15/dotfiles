-- Advised by the nvim-tree readme
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--require('plugins')
--require('options')

vim.o.termguicolors = true
vim.o.cursorline = true 

-- search related
vim.o.ignorecase = true -- ignore case when searching
vim.o.hlsearch = false -- highlight previous search pattern


vim.api.nvim_set_hl(0, 'WinSeperator', {bg = 'None', default = true})
vim.opt.fillchars = {vert = ' '}

-- Mouse settings
vim.o.mouse = "a"
vim.o.mousefocus = true

-- Line numbers
vim.o.number = true

-- Clipboard
vim.o.clipboard = "unnamedplus"
vim.o.paste = true

-- Indent Settings
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.wrap = true
vim.o.autoindent = true
vim.bo.autoindent = true

-- Color
vim.o.termguicolors = true
vim.cmd([[
    colorscheme desert
    syntax on
    filetype plugin on
]])

-- Undo
vim.o.undofile = true
vim.o.undodir = vim.fn.expand('~/.vimdid')

vim.o.hidden = true

-- Cmd area
vim.o.cmdheight = 1
vim.o.updatetime = 300

-- Ripgrep
if vim.fn.executable('rg') == 1 then
	vim.o.grepprg = 'rg --no-heading --vimgrep'
	vim.o.grepformat = '%f:%l:%c:%m'
end

vim.wo.signcolumn = 'number'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local packer = require('packer')

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    --use 'scrooloose/nerdTree'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
    }
    use 'tikhomirov/vim-glsl'
    use 'morhetz/gruvbox'
    use 'nvim-lualine/lualine.nvim'
    use 'windwp/nvim-autopairs'
    use 'lambdalisue/vim-fullscreen'
    use 'rhysd/vim-clang-format'
    -- TODO: replace with native lsp
    --use {
    --    'neoclide/coc.nvim',  
    --    branch = 'release'
    --}
    use 'neovim/nvim-lspconfig'
    --use 'jackguo380/vim-lsp-cxx-highlight'
    use 'mhinz/vim-startify'
    use 'tpope/vim-fugitive'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{ 'nvim-lua/plenary.nvim' }}
    }
    --use 'kien/ctrlp.vim'
    use 'lifepillar/vim-gruvbox8'
    use {
        'nvim-treesitter/nvim-treesitter', 
        --run = ':TSUpdate' 
    }
    use 'rust-lang/rust.vim'
    use 'airblade/vim-rooter'
    use {'junegunn/fzf', run = ':call fzf#install()' }
    use 'junegunn/fzf.vim'
    use 'voldikss/vim-floaterm'
    use 'Shatur/neovim-cmake'
    use 'mfussenegger/nvim-dap'
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use 'tomasr/molokai'
    use 'rafi/awesome-vim-colorschemes'
    use 'Th3Whit3Wolf/space-nvim'
    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp',  },
    }
    use 'numToStr/Comment.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    use 'folke/which-key.nvim'
end)


-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

vim.cmd([[
    autocmd FileType cpp ClangFormatAutoEnable
    autocmd FileType c ClangFormatAutoEnable
]])

require('nvim-tree').setup{
    --defaults = {
     --   file_ignore_patterns = {"libs","^build/", "^.git/", "%.so", "%.lib", "%.bmp", "compile_commands.json"}
    --}
}
require('lualine').setup()
require('nvim-autopairs').setup()
require'lspconfig'.clangd.setup{}
require'lspconfig'.tsserver.setup{}
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "cpp" },
    highlight = {
        enable = true
    }
}
--require('popup').setup()
--require('plenary').setup()
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "out",
            ".git",
            "libs"
        }
    }
}
--require('cmake').setup()
--require('plenary').setup()
--require('dap').setup()
--require('barbar').setup()
require('Comment').setup {
}

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

local wk = require('which-key')
wk.setup {
}

wk.register({
    b = {
        name = "buffers",
        b = {'<cmd>Telescope buffers<cr>', 'Buffers'},
    },
    f = {
        name = "find",
        f = {'<cmd>Telescope find_files<cr>', "find files"},
        g = {'<cmd>Telescope live_grep<cr>', "live grep"},
        b = {'<cmd>Telescope buffers<cr>', 'Buffers'},
        r = {'<cmd>Telescope lsp_references<cr>', 'references'},
        i = {'<cmd>Telescope lsp_implementations<cr>', 'implementations'},
        d = {'<cmd>Telescope lsp_definitions<cr>', 'definitions'},
        s = {'<cmd>Telescope lsp_document_symbols<cr>', 'document symbols'},
    }
}, {prefix = '<leader>'})

vim.keymap.set('n', '<leader>w', '<C-w>', {silent = true})
vim.keymap.set('n', '<F10>', '<Cmd>ClangdSwitchSourceHeader<CR>', {silent = true})
vim.keymap.set('x', 'p', "\"_dP")

