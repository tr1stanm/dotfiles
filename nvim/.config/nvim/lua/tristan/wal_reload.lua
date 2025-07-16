
-- Update your highlight groups with the new colors

-- Also reload notify setup if needed:

local uv = vim.loop
local path = vim.fn.expand("~/.cache/wal/colors.json")

local function reload_colors()
  -- set highlights as before...
	local wal = require("tristan.wal_colors")
	vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = wal["color4"] or "#83a598" })
	vim.api.nvim_set_hl(0, "NotifyINFOTitle",  { fg = wal["color4"] or "#83a598" })
	vim.api.nvim_set_hl(0, "NotifyINFOIcon",   { fg = wal["color4"] or "#83a598" })

	vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = wal["color1"] or "#fb4934" })
	vim.api.nvim_set_hl(0, "NotifyERRORTitle",  { fg = wal["color1"] or "#fb4934" })
	vim.api.nvim_set_hl(0, "NotifyERRORIcon",   { fg = wal["color1"] or "#fb4934" })
	require("notify").setup({
	  background_colour = wal["color0"] or "#000000",
	})
end

local watcher = uv.new_fs_poll()
watcher:start(path, 500, vim.schedule_wrap(function()
  reload_colors()
  local pywal = require('pywal')
  pywal.setup()
  local lualine = require('lualine')
  lualine.setup {
    options = {
      theme = 'pywal-nvim',
    },
  }

end))

