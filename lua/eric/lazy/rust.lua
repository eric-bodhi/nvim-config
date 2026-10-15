-- Rust: rustaceanvim drives rust-analyzer (from rustup), crates.nvim helps in Cargo.toml.
-- Formatting (rustfmt on save) is in lua/eric/lazy/formatting.lua.
return {
    {
        "mrcjkb/rustaceanvim",
        lazy = false, -- the plugin lazy-loads itself on Rust files
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(_, bufnr)
                        local function map(mode, lhs, rhs, desc)
                            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                        end
                        local function rust(...)
                            local args = { ... }
                            return function() vim.cmd.RustLsp(args) end
                        end

                        -- Overrides of the generic LSP keys with richer Rust versions
                        map("n", "gh", rust("hover", "actions"), "Hover (with actions)")
                        map({ "n", "x" }, "<leader>vca", rust("codeAction"), "Code action")

                        map("n", "<leader>rr", rust("runnables"), "Run…")
                        map("n", "<leader>rl", function() vim.cmd.RustLsp({ "runnables", bang = true }) end,
                            "Re-run last")
                        map("n", "<leader>rt", rust("testables"), "Tests…")
                        map("n", "<leader>re", rust("expandMacro"), "Expand macro")
                        map("n", "<leader>rx", rust("explainError", "current"), "Explain error")
                        map("n", "<leader>rd", rust("renderDiagnostic", "current"), "Full diagnostic")
                        map("n", "<leader>rc", rust("openCargo"), "Open Cargo.toml")
                        map("n", "<leader>rp", rust("parentModule"), "Parent module")
                        map("n", "<leader>rD", rust("openDocs"), "Open docs.rs")
                        map("n", "<leader>rj", rust("joinLines"), "Join lines (smart)")
                        map("n", "<leader>rm", rust("moveItem", "down"), "Move item down")
                        map("n", "<leader>rM", rust("moveItem", "up"), "Move item up")
                    end,
                    default_settings = {
                        ["rust-analyzer"] = {
                            cargo = { allFeatures = true },
                            check = { command = "clippy" }, -- clippy lints on save
                            inlayHints = {
                                closureReturnTypeHints = { enable = "with_block" },
                                lifetimeElisionHints = { enable = "skip_trivial" },
                            },
                        },
                    },
                },
            }
        end,
    },

    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {
            -- In-process LSP: completion of crate names/versions/features,
            -- hover for versions, and code actions to upgrade.
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
            popup = { border = "rounded" },
        },
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)

            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("EricCrates", { clear = true }),
                pattern = "Cargo.toml",
                callback = function(e)
                    local function map(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = e.buf, desc = desc })
                    end
                    map("<leader>rv", crates.show_versions_popup, "Crate versions")
                    map("<leader>rf", crates.show_features_popup, "Crate features")
                    map("<leader>ru", crates.upgrade_crate, "Upgrade crate")
                    map("<leader>rU", crates.upgrade_all_crates, "Upgrade all crates")
                    map("<leader>rD", crates.open_documentation, "Open crate docs")
                end,
            })
        end,
    },
}
