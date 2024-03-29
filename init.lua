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
--vim.o.paste = true

-- Indent Settings
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.wrap = true
vim.o.autoindent = true
vim.bo.autoindent = true


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
    use 'prettier/vim-prettier'
    use 'josebalius/vim-light-chromeclipse'
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        --tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        --run = "make install_jsregexp"
    })
    use 'saadparwaiz1/cmp_luasnip'
end)

-- Color
vim.o.termguicolors = true
vim.cmd([[
    colorscheme hybrid_reverse
    syntax on
    filetype plugin on
]])

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
    autocmd FileType typescript ClangFormatAutoDisable
    autocmd BufWritePre *.ts PrettierAsync
]])

require('nvim-tree').setup{
    --defaults = {
    --    file_ignore_patterns = {"libs","^build/", "^.git/", "%.so", "%.lib", "%.bmp", "compile_commands.json"}
    --}
    filters = {
        git_ignored = true,
    }
}
require('lualine').setup()
require('nvim-autopairs').setup()

vim.filetype.add({extension = {wgsl = "wgsl"}})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.wgsl = {
    install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = {"src/parser.c", "src/scanner.c"}
    },
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "cpp", "wgsl" },
    highlight = {
        enable = true
    }
}
--require('popup').setup()
local actions = require("telescope.actions")
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules/.*",
            "out/.*",
            ".git/.*",
            "libs/.*",
            "conan/.*",
            ".vscode/.*",
            ".idea/.*",
            ".cmake/.*",
            ".vs/.*",
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    },
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

local cmp = require('cmp')

cmp.setup {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
}

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  --}
require'lspconfig'.clangd.setup{
    capabilities = capabilities
}
require'lspconfig'.tsserver.setup{
    capabilities = capabilities
}

local wk = require('which-key')
wk.setup {
}

wk.register({
    b = {
        name = "buffers",
        b = {'<cmd>Telescope buffers<cr>', 'Buffers'},
    },
    l = {
        name = "lsp",
        d = {function() vim.lsp.buf.hover() end, 'show documentation'},

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
    },
    n = {
        name = "nvim tree",
        t = {'<cmd>NvimTreeToggle<cr>', 'toggle'},
        r = {'<cmd>NvimTreeRefresh<cr>', 'refresh'},
    }
}, {prefix = '<leader>'})

vim.keymap.set('n', '<leader>w', '<C-w>', {silent = true})
vim.keymap.set('n', '<F10>', '<Cmd>ClangdSwitchSourceHeader<CR>', {silent = true})
--vim.keymap.set('n', '<F5>', '<Cmd>FloatermToggle tm<CR>', {silent = true})
--vim.keymap.set('t', '<F5>', '<Cmd>FloatermToggle tm<CR>', {silent = true})
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>:CFloatTerm<CR>', {noremap = true, silent = true})
vim.keymap.set('x', 'p', "\"_dP")
vim.keymap.set('n', '<F5>', '<Cmd>:wa <bar> make -C ./build/Debug<CR>', {noremap = true})
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.keymap.set('i', '<C-Space>', vim.lsp.omnifunc, {silent = true, buffer = args.buf }) 
	end
})

vim.g.floaterm_wintype = 'split'
vim.g.floaterm_height = 0.2

vim.o.makeprg = "ninja"
