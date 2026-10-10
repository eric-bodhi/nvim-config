local opt = vim.opt

-- Line numbers
opt.nu = true
opt.relativenumber = true
opt.cursorline = true

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Display
opt.wrap = false
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "100" -- rustfmt's default max width
opt.showmode = false -- lualine shows the mode
opt.winborder = "rounded" -- rounded borders on all floating windows
opt.splitright = true
opt.splitbelow = true

-- Files / undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.isfname:append("@-@")
opt.updatetime = 50
opt.timeoutlen = 400 -- how long which-key waits before popping up

-- Diagnostics
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = { spacing = 2, prefix = "●" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
    },
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
})
