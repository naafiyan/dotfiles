local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
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

	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	-- no config plugins
	{'tpope/vim-repeat'},
	{ 'tpope/vim-sleuth' },
	{ "catppuccin/nvim",                     name = "catppuccin", flavour = "mocha", priority = 1000 },
	{ "nvim-tree/nvim-web-devicons" },
	{ 'nvim-lualine/lualine.nvim' },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl",        opts = {} },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "editorconfig/editorconfig-vim" },
	{ 'lewis6991/gitsigns.nvim' },
	{ 'tpope/vim-fugitive' },
	{ "tpope/vim-surround" },

	{
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
		}
	},
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim',       opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},
	{ 'stevearc/oil.nvim' },

	-- Utilities
	{ 'moll/vim-bbye' },
	{ 'nvim-lua/plenary.nvim' },
	-- Fuzzy finder
	{ 'nvim-telescope/telescope.nvim',             branch = '0.1.x' },
	{ 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
	{ "nvim-telescope/telescope-file-browser.nvim" },

	{ "folke/which-key.nvim" },
	-- Autocomplete
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'hrsh7th/cmp-nvim-lsp' },

	-- lsp signature help
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts) require 'lsp_signature'.setup(opts) end
	},
	-- Snippets
	{ 'L3MON4D3/LuaSnip' },
	{ 'rafamadriz/friendly-snippets' },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"mrcjkb/rustaceanvim",
		version = '^4',
		ft = { 'rust' },
	},
	{ 'numToStr/Comment.nvim' },

	-- latex
	{ "lervag/vimtex" },

	-- autoclose bracket
	{ "cohama/lexima.vim" },

	{
		"epwalsh/obsidian.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp"
		}

	},
	{ "folke/twilight.nvim" },
	{
		"folke/zen-mode.nvim",
		opts = {
			options = {
				number = false,     -- disable number column
				relativenumber = false, -- disable relative numbers
			},
		}
	},
	{
		'declancm/cinnamon.nvim',
		config = function() require('cinnamon').setup() end
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"letieu/harpoon-lualine",
		dependencies = {
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
			}
		},
	  }
})
return lazy
