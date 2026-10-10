-- Press <Space> (or any prefix like g, [, ], z, ") and wait: a popup lists every key.
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        spec = {
            { "<leader>p", group = "Find (Telescope)" },
            { "<leader>v", group = "LSP / Vim" },
            { "<leader>vr", group = "References / Rename / Restart" },
            { "<leader>t", group = "Trouble" },
            { "<leader>g", group = "Git" },
            { "<leader>r", group = "Rust" },
            { "<leader>m", group = "Misc" },
        },
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Keymaps for this buffer",
        },
    },
}
