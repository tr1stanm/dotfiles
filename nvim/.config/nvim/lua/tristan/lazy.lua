local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--many of these taken from the list at jdhao/nvim-config
require("lazy").setup({
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-path",
	"hrsh7th/vim-vsnip",
	"hrsh7th/vim-vsnip-integ",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"rcarriga/nvim-notify",
	"neovim/nvim-lspconfig",
	"rafamadriz/friendly-snippets",
	{ 'rose-pine/neovim', name = 'rose-pine' },
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	"BurntSushi/ripgrep",
	{ "nvim-telescope/telescope.nvim", tag = '0.1.5' },
	"nvim-treesitter/nvim-treesitter",
	"karb94/neoscroll.nvim",
	"fenetikm/falcon",
	"AlexvZyl/nordic.nvim",
	"ntk148v/komau.vim",
	"kvrohit/mellow.nvim",
	"famiu/feline.nvim",
	--"vim-airline/vim-airline",
	--"vim-airline/vim-airline-themes",
	"AlphaTechnolog/pywal.nvim",
	"nvim-lualine/lualine.nvim"
})
