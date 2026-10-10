-- Load order matters: leader must be set before lazy.nvim registers plugin keys.
require("eric.options")
require("eric.keymaps")
require("eric.autocmds")
require("eric.lazy_init")
