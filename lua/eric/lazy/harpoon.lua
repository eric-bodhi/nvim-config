local opts = { noremap = true, silent = true }

return {
    {
        "ThePrimeagen/harpoon",
        opts = {
            global_settings = {
                tabline = true,
                tabline_prefix = "   ",
                tabline_suffix = "   ",
            },
        },

        menu = {
            width = vim.api.nvim_win_get_width(0) - 10

        },

        config = function()
            vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
            vim.cmd("highlight! HarpoonActive guibg=NONE guifg=black")
            vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
            vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
            vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
        end,
        keys = {
            {
                "<leader>a",
                function()
                    require("harpoon.mark").add_file()
                end,
                desc = "Add harpoon mark",
                opts,
            },
            {
                "<C-e>",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                desc = "Harpoon toggle quick menu",
                opts,
            },
            {
                "<space>hc",
                function()
                    require("harpoon.mark").clear_all()
                end,
                opts,
            },
            {
                "<leader>1>",
                function()
                    require("harpoon.ui").nav_file(1)
                end,
                opts,
            },
            {
                "<leader>2>",
                function()
                    require("harpoon.ui").nav_file(2)
                end,
                opts,
            },
            {
                "<leader>3>",
                function()
                    require("harpoon.ui").nav_file(3)
                end,
                opts,
            },
            {
                "<leader>4>",
                function()
                    require("harpoon.ui").nav_file(4)
                end,
                opts,
            },
        },
    },
}
