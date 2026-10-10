return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            local gs = require("gitsigns")
            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "]h", function() gs.nav_hunk("next") end, "Next git hunk")
            map("n", "[h", function() gs.nav_hunk("prev") end, "Prev git hunk")
            map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
            map("n", "<leader>gs", gs.stage_hunk, "Stage/unstage hunk")
            map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
            map("n", "<leader>gb", gs.blame_line, "Blame line")
            map("n", "<leader>gd", gs.diffthis, "Diff file")
        end,
    },
}
