return {
    "ThePrimeagen/harpoon",
    opts = {
        global_settings = {
            tabline = true,
            tabline_prefix = "   ",
            tabline_suffix = "   ",
        },
    },
    config = function(_, opts)
        require("harpoon").setup(opts)
        vim.api.nvim_set_hl(0, "HarpoonInactive", { fg = "#63698c" })
        vim.api.nvim_set_hl(0, "HarpoonActive", { fg = "#abb2bf", bold = true })
        vim.api.nvim_set_hl(0, "HarpoonNumberActive", { fg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { fg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "TabLineFill", { fg = "white" })
    end,
    keys = {
        { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "Harpoon: add file" },
        { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon: menu" },
        { "<leader>c", function() require("harpoon.mark").clear_all() end, desc = "Harpoon: clear all" },
        { "<leader>h", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon file 1" },
        { "<leader>j", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon file 2" },
        { "<leader>k", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon file 3" },
        { "<leader>l", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon file 4" },
    },
}
