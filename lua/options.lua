

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

-- Color
vim.o.termguicolors = true
vim.cmd([[
    colorscheme atom
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
