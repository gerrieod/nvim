return {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "make",
  cond = function()
    return vim.fn.executable("make") == 1
  end,
  dependencies = {"nvim-telescope/telescope.nvim"},
  config = function()
    require("telescope").load_extension("fzf")
  end,
}
