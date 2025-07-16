local pywal = require('pywal')

pywal.setup()

local lualine = require('lualine')

lualine.setup {
  options = {
    theme = 'pywal-nvim',
  },
}

vim.cmd("source ~/.cache/wal/colors-wal.vim")

local wal = require("tristan.wal_colors")

vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = wal["color4"] or "#83a598" })
vim.api.nvim_set_hl(0, "NotifyINFOTitle",  { fg = wal["color4"] or "#83a598" })
vim.api.nvim_set_hl(0, "NotifyINFOIcon",   { fg = wal["color4"] or "#83a598" })

vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = wal["color1"] or "#fb4934" })
vim.api.nvim_set_hl(0, "NotifyERRORTitle",  { fg = wal["color1"] or "#fb4934" })
vim.api.nvim_set_hl(0, "NotifyERRORIcon",   { fg = wal["color1"] or "#fb4934" })

require("notify").setup {
	  background_colour = wal["color0"] or "#000000", -- fallback
	  stages = "fade_in_slide_out",
	  render = "default",
	  timeout = 3000,
}
