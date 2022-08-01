local packer = require('packer')

packer.startup(function(use)
use 'jonathanfilip/vim-lucius'
use 'scrooloose/nerdTree'
use 'tikhomirov/vim-glsl'
use 'morhetz/gruvbox'
use 'vim-airline/vim-airline'
use 'jiangmiao/auto-pairs'
use 'lambdalisue/vim-fullscreen'
use 'chandlerc/jellybeans.vim'
use 'altercation/vim-colors-solarized'
use 'godlygeek/csapprox'
use 'CreaturePhil/vim-handmade-hero'
use 'tomasiser/vim-code-dark'
use 'mg979/vim-studio-dark'
use 'rhysd/vim-clang-format'
use 'vim-scripts/Dutyl'
use 'neoclide/coc.nvim',  {'branch': 'release'}
use 'jackguo380/vim-lsp-cxx-highlight'
use 'joshdick/onedark.vim'
use 'rakr/vim-one'
use 'mhinz/vim-startify'
use 'tpope/vim-fugitive'
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'kien/ctrlp.vim'
use 'ackyshake/Spacegray.vim'
use 'lifepillar/vim-gruvbox8'
use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate' 
}
use 'rust-lang/rust.vim'
use 'skywind3000/asyncrun.vim'
use 'airblade/vim-rooter'
use 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
use 'junegunn/fzf.vim'
use 'voldikss/vim-floaterm'
use 'Shatur/neovim-cmake'
use 'nvim-lua/plenary.nvim'
use 'mfussenegger/nvim-dap'
use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
}
use 'tomasr/molokai'
use 'rafi/awesome-vim-colorschemes'
end)
