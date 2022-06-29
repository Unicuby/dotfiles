local coq = require "coq"
local lsp = require "lspconfig"

require'lspconfig'.clangd.setup{coq.lsp_ensure_capabilities()}
require'lspconfig'.asm_lsp.setup{coq.lsp_ensure_capabilities()}
require'lspconfig'.pylsp.setup{coq.lsp_ensure_capabilities()}

lsp.sumneko_lua.setup{
    coq.lsp_ensure_capabilities{
        settings = {
            Lua = {

                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim', 'use'},
                },

                telemetry = {
                    enable = false,
                },
            },
        },
    }
}
