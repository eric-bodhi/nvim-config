-- <leader>f formats any file. Rust is also formatted on save with rustfmt.
local format_on_save = { rust = true }

return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>f",
            function() require("conform").format({ async = true }) end,
            mode = { "n", "x" },
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            rust = { "rustfmt" },
        },
        default_format_opts = {
            lsp_format = "fallback", -- use the language server when there's no formatter
        },
        format_on_save = function(bufnr)
            if format_on_save[vim.bo[bufnr].filetype] then
                return { timeout_ms = 1000 }
            end
        end,
    },
}
