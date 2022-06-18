vim.g.coq_settings = {
    auto_start = true,

    keymap = {
        recommended = true,
        pre_select = true
    },

    clients = {
        tabnine = {
            enabled = false
        }
    }
}
local coq = require('coq')

vim.cmd('COQnow')
