-- Language servers are installed by Mason (:Mason) and enabled automatically.
-- Rust is the exception: rustaceanvim (lua/eric/lazy/rust.lua) runs rust-analyzer
-- from your rustup toolchain. LSP keymaps are in lua/eric/autocmds.lua.
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "mason-org/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Applies to every server
            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = {
                            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                        },
                    },
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "taplo", -- TOML (Cargo.toml)
                },
                automatic_enable = {
                    exclude = { "rust_analyzer" }, -- handled by rustaceanvim
                },
            })
        end,
    },

    -- Makes lua_ls understand the Neovim API while editing this config
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
