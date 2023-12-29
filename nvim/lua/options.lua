vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.showmode = false
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.modifiable = true
vim.opt.termguicolors = true

-- autocomplete menu settings
vim.opt.completeopt = {"menu", 'menuone', 'noselect'}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '

-- THEME
vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "tokyonight"
-- vim.cmd.colorscheme "kanagawa"
-- vim.cmd.colorscheme "gruvbox"
