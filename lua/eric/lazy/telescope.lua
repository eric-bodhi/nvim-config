return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                sorting_strategy = "ascending",
                layout_config = { prompt_position = "top" },
            },
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown() },
            },
        })
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select") -- code actions etc. use Telescope
    end,
    keys = {
        { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Find files" },
        { "<C-p>", function() require("telescope.builtin").git_files() end, desc = "Find git files" },
        { "<leader>pg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
        {
            "<leader>ps",
            function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
            desc = "Grep for string",
        },
        {
            "<leader>pws",
            function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") }) end,
            desc = "Grep word under cursor",
        },
        {
            "<leader>pWs",
            function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") }) end,
            desc = "Grep WORD under cursor",
        },
        { "<leader>pb", function() require("telescope.builtin").buffers() end, desc = "Open buffers" },
        { "<leader>pr", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
        { "<leader>pd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
        { "<leader>pk", function() require("telescope.builtin").keymaps() end, desc = "Search keymaps" },
        { "<leader>vh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    },
}
