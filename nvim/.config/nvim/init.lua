package.path = package.path .. ";/usr/share/lua/5.4/?.lua"

local json = require("dkjson")  -- now it should work

require("tristan")
require("tristan.lazy")
require("tristan.nvim-tree")
require("tristan.neoscroll")
require("telescope").setup()
--require("tristan.ft")
require("tristan.cmp")
require("tristan.lsp_config")
require("tristan.pywal")
require("tristan.wal_reload")
require("notify")("hello again.")

--vim.cmd[[ set background=dark]]
--vim.cmd("let g:airline_theme='distinguished'")
--vim.cmd("colorscheme mellow")
vim.cmd("set number")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
