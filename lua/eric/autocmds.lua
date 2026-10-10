local augroup = vim.api.nvim_create_augroup("Eric", {})
local autocmd = vim.api.nvim_create_autocmd

-- Flash the yanked region
autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 40 })
    end,
})

-- Strip trailing whitespace on save (keeping the cursor where it was)
autocmd("BufWritePre", {
    group = augroup,
    callback = function()
        if not vim.bo.modifiable then
            return
        end
        local view = vim.fn.winsaveview()
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.fn.winrestview(view)
    end,
})

-- LSP keymaps, set for every buffer a language server attaches to.
-- Rust buffers get extra keymaps from lua/eric/lazy/rust.lua.
autocmd("LspAttach", {
    group = augroup,
    callback = function(e)
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = e.buf, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")

        map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
        map("n", "<leader>vd", vim.diagnostic.open_float, "Line diagnostics")
        map({ "n", "x" }, "<leader>vca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>vrr", vim.lsp.buf.references, "References")
        map("n", "<leader>vrn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>vrs", "<cmd>lsp restart<cr>", "Restart LSP")
        map("n", "<leader>vi", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = e.buf }), { bufnr = e.buf })
        end, "Toggle inlay hints")

        map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
        map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")

        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = e.buf })
        end
    end,
})
