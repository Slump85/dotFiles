-- ###########
-- # KEYMAPS #
-- ###########

local key = vim.keymap.set
local full_options = { noremap = true, silent = true }
local noremap = { noremap = true }

vim.g.mapleader = " "
key("n","<leader>pv", vim.cmd.Ex)

-- #############
-- # NVIM-TREE #
-- #############

key("n", "<C-a>", ":NvimTreeToggle<CR>", full_options)
key("n", "<C-f>", ":NvimTreeFindFile<CR>", full_options)
