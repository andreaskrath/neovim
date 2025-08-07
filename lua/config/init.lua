-- The mapleader and maplocalleader must be set before lazy loads
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.keymaps")
require("config.options")
require("config.autocommands")
require("config.lazy")
require("config.extras")
require("config.lsp")
