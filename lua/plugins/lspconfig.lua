return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
	},

	opts = {
		servers = {
			lua_ls = {},
			gopls = {},
			pyright = {},
			bashls = {},
		},
	},

	config = function(_, opts)
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		-- Ensure packages installed for non lsp's
		local ensure_installed = vim.tbl_keys(opts.servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used format lua code
			"prettierd", -- Used to format javascript
			"isort", -- python sort alphabetically
			"black", -- python code formatter
			"goimports", -- go automatic imports
			"gofumpt", -- go code formatter
			"djlint", -- format html django and go templates
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for server, _ in pairs(opts.servers) do
			vim.lsp.config(server, {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.enable(server)
		end

		-- Diagnostics configurations
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFOR] = "",
				[vim.diagnostic.severity.HINT] = "",
			},
		})
	end,
}
