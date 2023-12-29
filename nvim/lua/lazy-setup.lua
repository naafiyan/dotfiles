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
	-- Themes
 --  	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- {'rebelot/kanagawa.nvim'},
--	{'ellisonleao/gruvbox.nvim', priority = 1000},

	{'nvim-lualine/lualine.nvim'},
	{'akinsho/bufferline.nvim'},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{"nvim-treesitter/nvim-treesitter"},
	{"editorconfig/editorconfig-vim"},
	{'lewis6991/gitsigns.nvim'},
  	{'tpope/vim-fugitive'},
	{"tpope/vim-surround"},
	{'neovim/nvim-lspconfig'},
	{'stevearc/oil.nvim'},

	-- Utilities
  	{'moll/vim-bbye'},
  	{'nvim-lua/plenary.nvim'},
	-- Fuzzy finder
	{'nvim-telescope/telescope.nvim', branch = '0.1.x'},
	{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
	{"nvim-telescope/telescope-file-browser.nvim"},

	{"folke/which-key.nvim"},
	 -- Autocomplete
  	{'hrsh7th/nvim-cmp'},
  	{'hrsh7th/cmp-buffer'},
  	{'hrsh7th/cmp-path'},
  	{'saadparwaiz1/cmp_luasnip'},
  	{'hrsh7th/cmp-nvim-lsp'},
	  -- Snippets
  	{'L3MON4D3/LuaSnip'},
  	{'rafamadriz/friendly-snippets'},
	{"nvim-treesitter/nvim-treesitter-textobjects"},

	-- lean
	{'Julian/lean.nvim'},
	
	{'simrat39/rust-tools.nvim'},
	{'mfussenegger/nvim-dap'},
	{'numToStr/Comment.nvim'},

	-- latex
	{"lervag/vimtex"},

	-- autoclose bracket
	{ "cohama/lexima.vim" }
})

return lazy
