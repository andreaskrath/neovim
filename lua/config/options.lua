-- Whether to show line numbers
vim.opt.number = true

-- Whether line numbers should be relative
vim.opt.relativenumber = true

-- The number of columns to reserve for line numbers to be shown
vim.opt.numberwidth = 5

-- Always show sign column
vim.opt.signcolumn = "yes"

-- Replace tabs with spaces
vim.opt.expandtab = true

-- Indents when appropriate
-- vim.opt.smartindent = true

-- The number of columns a tab is displayed as
vim.opt.tabstop = 4

-- The number of spaces is inserted when tab is pressed
vim.opt.softtabstop = 4

-- The number of columns indenting with '<' and '>' moves the text
vim.opt.shiftwidth = 4

-- Disables mouse
vim.opt.mouse = ""

-- Determines cursor shape
vim.opt.guicursor = "n-c-sm:block,i-ci-ve:ver25,r-cr-o-v:hor20"

-- Whether the current mode should be displayed
vim.opt.showmode = false

-- The number of rows to always show "below" or "above" the cursor line
vim.opt.scrolloff = 5

-- The number of milliseconds to wait for mapped sequences to complete
vim.opt.timeoutlen = 1000

vim.opt.updatetime = 250

-- The maximum number of items to show in pop up menu
vim.opt.pumheight = 10

-- Whether to enable 24-bit RGB coloring
vim.opt.termguicolors = true

-- Allow yanking outside of neovim
vim.opt.clipboard = "unnamedplus"
