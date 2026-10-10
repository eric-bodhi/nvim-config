return {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000, -- load before every other plugin
    config = function()
        require("onedarkpro").setup({
            styles = {
                comments = "italic",
                keywords = "bold,italic",
                functions = "italic",
                conditionals = "italic",
            },
            options = {
                cursorline = true,
            },
        })
        vim.cmd.colorscheme("onedark")
    end,
}
