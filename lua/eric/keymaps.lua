-- General keymaps. Plugin keymaps live next to their plugin in lua/eric/lazy/,
-- LSP keymaps live in lua/eric/autocmds.lua. Press <Space> and wait to see them all.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Files
map("n", "<leader>pv", "<cmd>Oil<cr>", "File explorer (Oil)")
map("n", "-", "<cmd>Oil<cr>", "Open parent directory")
map("n", "<leader>x", "<cmd>!chmod +x %<cr>", "Make file executable")
map("n", "<leader><leader>", "<cmd>source %<cr>", "Source current file")
map("n", "<leader>vk", function()
    vim.cmd.split(vim.fn.stdpath("config") .. "/KEYMAPS.md")
end, "Open keymap cheatsheet")

-- Move selected lines up/down
map("x", "J", ":m '>+1<cr>gv=gv", "Move selection down")
map("x", "K", ":m '<-2<cr>gv=gv", "Move selection up")

-- Keep the cursor centered
map("n", "<leader>J", "mzJ`z", "Join lines (keep cursor)")
map("n", "<C-d>", "<C-d>zz", "Half page down (centered)")
map("n", "<C-u>", "<C-u>zz", "Half page up (centered)")
map("n", "n", "nzzzv", "Next match (centered)")
map("n", "N", "Nzzzv", "Prev match (centered)")

-- Clipboard / registers
map({ "n", "x" }, "<leader>y", [["+y]], "Yank to system clipboard")
map("n", "<leader>Y", [["+Y]], "Yank line to system clipboard")
map({ "n", "x" }, "<leader>d", [["_d]], "Delete without yanking")
map("n", "<C-a>", "ggVG", "Select all")

-- Editing
map("i", "<C-c>", "<Esc>", "Escape")
map("n", "Q", "<nop>", "Disabled (no Ex mode)")
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Substitute word under cursor")

-- Windows
map("n", "H", "<C-w>h", "Window left")
map("n", "J", "<C-w>j", "Window down")
map("n", "K", "<C-w>k", "Window up")
map("n", "L", "<C-w>l", "Window right")

-- Terminal
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", "Terminal in vertical split")
map("n", "<leader>ts", "<cmd>split | terminal<cr>", "Terminal in horizontal split")
map("t", "<Esc><Esc>", [[<C-\><C-n>]], "Leave terminal mode")

-- Fun
map("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<cr>", "Make it rain")
