return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "nvim-mini/mini.icons",
        },
        config = function()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- The insert preset also gives: <C-Space> open, <C-e> close,
                -- <C-y> confirm, <C-b>/<C-f> scroll docs.
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "lazydev", group_index = 0 },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    format = function(_, item)
                        local icon, hl = require("mini.icons").get("lsp", item.kind)
                        item.kind = icon .. " " .. item.kind
                        item.kind_hl_group = hl
                        return item
                    end,
                },
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } },
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            })

            -- Insert `(` after completing a function
            local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
            if ok then
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            ls.filetype_extend("javascript", { "jsdoc" })

            local function map(lhs, rhs, desc, modes)
                vim.keymap.set(modes or { "i", "s" }, lhs, rhs, { silent = true, desc = desc })
            end
            map("<C-s>e", function() ls.expand() end, "Snippet: expand", { "i" })
            map("<C-s>;", function() ls.jump(1) end, "Snippet: next field")
            map("<C-s>,", function() ls.jump(-1) end, "Snippet: prev field")
            map("<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, "Snippet: next choice")
        end,
    },
}
