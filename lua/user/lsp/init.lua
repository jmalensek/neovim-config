-- nvim/lua/user/lsp/init.lua

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.lsp-config")

-- Enables LS
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.html.setup {}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.marksman.setup {}
require 'lspconfig'.cmake.setup {}
require 'lspconfig'.lua_ls.setup {}
