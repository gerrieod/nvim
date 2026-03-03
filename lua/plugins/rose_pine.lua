return {
  "rose-pine/neovim",
  name ="rose-pine",
  config = function()
    require("rose-pine").setup({
      --dark_variant = "main",
      dark_variant = "moon",
      --dark_variant = "dawn",
      bold_vert_split = false,
      dim_nc_background = true,
      --removes background color if you want transparent terminal
      disable_background = true,
      disable_float_background = true,
      highlight_groups = {},
      extend_background_behind_borders = true,
    })
    -- set the colorscheme
    vim.cmd("colorscheme rose-pine")

  end,
}
