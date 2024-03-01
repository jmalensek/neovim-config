-- nvim/lua/user/lsp/init.lua

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
