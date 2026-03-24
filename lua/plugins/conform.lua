return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			python = { "ruff" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
		},

		format_on_save = {
			async = false,
			lsp_format = true,
			timeout_ms = 500,
		},
	},
}
