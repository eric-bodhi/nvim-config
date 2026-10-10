return {
    "stevearc/oil.nvim",
    lazy = false, -- so `nvim .` opens Oil instead of netrw
    dependencies = { "nvim-mini/mini.icons" },
    ---@module "oil"
    ---@type oil.SetupOpts
    opts = {
        view_options = { show_hidden = true },
        keymaps = {
            -- Keep <C-h>/<C-l> for window navigation; split with <C-x> instead
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
        },
        float = { border = "rounded" },
    },
}
