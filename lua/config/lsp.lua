local coq = require "coq"
local lsp = require "lspconfig"

-- enable keybindings only when an lsp is running
local function lsp_keymaps(bufnr)
    -- noremap => remaps the keybinding remving older map, silent=true => doesn't displays the sequence, buffer = bufnr => only apllies mappiing to current buffer
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- go to definition (like with ctags)
    vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

    -- Generate references
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- displays function information (overrides the documentation opener)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- generates action
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- formats the current buffer
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
end

lsp.clangd.setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach,
}))

require 'lspconfig'.asm_lsp.setup(coq.lsp_ensure_capabilities())

lsp.pylsp.setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach
}))

lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim', 'use' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach
}))
