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
    --use 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
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
end)

require('nvim-tree').setup{
    --defaults = {
     --   file_ignore_patterns = {"libs","^build/", "^.git/", "%.so", "%.lib", "%.bmp", "compile_commands.json"}
    --}
}
require('lualine').setup()
require('nvim-autopairs').setup()
require'lspconfig'.clangd.setup{}
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "cpp" },
    highlight = {
        enable = true
    }
}
--require('popup').setup()
--require('plenary').setup()
--require('telescope').setup()
--require('cmake').setup()
--require('plenary').setup()
--require('dap').setup()
--require('barbar').setup()
