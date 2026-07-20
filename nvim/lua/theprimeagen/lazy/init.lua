local local_plugins = require("theprimeagen.lazy.local")

return vim.list_extend({
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    "eandrju/cellular-automaton.nvim",
}, local_plugins)

