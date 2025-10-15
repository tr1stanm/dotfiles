require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
	  "${3rd}/luv/library"
        }
      }
    })
  end,
  settings = {
    Lua = {}
  },
	--on_attach = on_attach,
	--capabilities = capabilities
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
	}
})

local on_attach = function(_, _)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end


require('lspconfig').clangd.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {"clangd", "--header-insertion=never"}
	--filetypes = { "cpp", "cppx", "c", "h", "hpp", "inl", "tpp" },
}

require'lspconfig'.pyright.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

require('lspconfig').qmlls.setup {
  cmd = { "/usr/lib/qt6/bin/qmlls", "--verbose" },
  cmd_env = {
    QML_IMPORT_PATH = "/usr/lib/qt6/qml:/usr/bin/quickstart",
    QT_PLUGIN_PATH = "/usr/lib/qt6/plugins",
    QML2_IMPORT_PATH = "/usr/lib/qt6/qml"
  },
  root_dir = require('lspconfig.util').root_pattern(".git", ".qmlls.ini", "*.qml"),
  on_attach = function(client, bufnr)
    print("qmlls attached!")
  end,
  capabilities = capabilities,
}

vim.diagnostic.config({
  virtual_text = true
})

