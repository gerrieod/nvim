return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		-- Ensure all parsers are installed and up-to-date
		require("nvim-treesitter.install").update({ with_sync = true })
	end,

	event = { "BufReadPost", "BufNewFile" }, -- lazy-load on file open

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects", -- optional for textobjects
	},
	config = function()
		local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
		if not ok then
			return
		end

		ts_configs.setup({
			-- Languages you want installed
			ensure_installed = {
				"vim",
				"go",
				"lua",
				"python",
				"javascript",
				"typescript",
				"json",
				"html",
				"css",
				"bash",
				"dockerfile",
				"yaml",
				"markdown",
				"djangohtml",
			},

			-- Highlighting and indentation
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },

			-- Incremental selection (expand/shrink selection with keymaps)
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>", -- start selection
					node_incremental = "<Enter>", -- expand node
					scope_incremental = false, -- expand scope
					node_decremental = "<Backspace>", -- shrink selection
				},
			},

			-- Textobjects for motions and selections
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- adds to jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},

			-- Auto-install missing parsers when entering buffer
			auto_install = true,
		})
	end,
}
