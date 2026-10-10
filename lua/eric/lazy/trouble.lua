return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
        { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
        { "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
        { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols outline" },
        { "<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
        {
            "]t",
            function() require("trouble").next({ skip_groups = true, jump = true }) end,
            desc = "Next Trouble item",
        },
        {
            "[t",
            function() require("trouble").prev({ skip_groups = true, jump = true }) end,
            desc = "Prev Trouble item",
        },
    },
}
