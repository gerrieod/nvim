-- this is keymaps

vim.g.mapleader = " "

-- auto format documents
vim.keymap.set("n", "<leader>F", function()
        require("conform").format(
                {
                        lsp_format = "fallback"
                }
        )
end, { desc = "format current file" })

-- keymap to save file
vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "save file" })

-- keymap to quit neovim
vim.keymap.set("n", "<leader>Q", vim.cmd.quit, { desc = "Quit window" })

-- keymap for file explorer
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open the Oil file explorer" })

-- search highlighting
vim.keymap.set("n", "<leader>h", vim.cmd.nohlsearch, { desc = "Clear search highlight" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upprt window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })


-- Reselect after indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Telescope keymappings
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })

-- LSP Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
