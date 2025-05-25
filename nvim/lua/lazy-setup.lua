local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	-- You can "comment out" the line below after lazy.nvim is installed
	-- lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)

	require("lazy").setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}

lazy.setup({
	-- no config plugins
	{ "tpope/vim-repeat" },
	{ "tpope/vim-sleuth" },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-lualine/lualine.nvim" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "editorconfig/editorconfig-vim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-surround" },

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
	},
	{ "stevearc/oil.nvim" }, -- Utilities
	{ "moll/vim-bbye" },
	{ "nvim-lua/plenary.nvim" }, -- Fuzzy finder
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "folke/which-key.nvim" },

	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "numToStr/Comment.nvim" },
	{
		"saghen/blink.cmp",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>lf",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500 },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
})
return lazy
