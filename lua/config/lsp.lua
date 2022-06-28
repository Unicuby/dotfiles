local coq = require "coq"

require'lspconfig'.clangd.setup{coq.lsp_ensure_capabilities()}
require'lspconfig'.asm_lsp.setup{coq.lsp_ensure_capabilities()}
require'lspconfig'.pylsp.setup{coq.lsp_ensure_capabilities()}
require'lspconfig'.sumneko_lua.setup{coq.lsp_ensure_capabilities()}
