require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"css",
		"json",
		"lua",
		"cpp",
		"python",
		"c",
		"svelte",
		"rust",
	},
	textobjects = {
		move = {
			enable = true,
			goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
			goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
			goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
			goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
		},
	},
})
