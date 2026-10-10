-- Uses the `main` branch of nvim-treesitter (the rewrite for Neovim 0.12).
-- Needs the `tree-sitter` CLI to build parsers: `brew install tree-sitter-cli`.
local parsers = {
    "rust", "toml", "ron",
    "c", "cpp", "lua", "luadoc", "bash",
    "javascript", "typescript", "jsdoc", "json", "yaml",
    "markdown", "markdown_inline", "vim", "vimdoc", "query",
    "html", "gitcommit", "diff",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("EricTreesitter", { clear = true }),
            callback = function(e)
                -- Highlighting and indentation for any language that has a parser
                if pcall(vim.treesitter.start, e.buf) then
                    vim.bo[e.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
