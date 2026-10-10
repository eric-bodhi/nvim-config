-- Things that make Neovim look nice.
return {
    {
        "nvim-mini/mini.icons",
        lazy = true,
        opts = {},
        init = function()
            -- Let plugins that expect nvim-web-devicons use mini.icons instead.
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "lsp_status", "filetype" },
            },
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            indent = { char = "│" },
            scope = { show_start = false, show_end = false },
        },
    },

    {
        "j-hui/fidget.nvim", -- LSP progress in the corner
        event = "LspAttach",
        opts = {},
    },
}
