return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	opts = {},
	config = function()
		require("kanagawa").setup({
			theme = "dragon",
			compile = true,
			transparent = true,
		})
		vim.cmd("colorscheme kanagawa-dragon")
	end,
	build = function()
		vim.cmd("kanagawaCompile")
	end,
}
