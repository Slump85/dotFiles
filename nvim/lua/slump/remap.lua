-- ###########
-- # KEYMAPS #
-- ###########

local key = vim.keymap.set
local full_options = { noremap = true, silent = true }
local noremap = { noremap = true }

vim.g.mapleader = " "
key("n","<leader>pv", vim.cmd.Ex)

key("n", "<leader>pv", vim.cmd.Ex)

key("v", "J", ":m '>+1<CR>gv=gv")
key("v", "K", ":m '<-2<CR>gv=gv")

key("n", "J", "mzJ`z")
key("n", "<C-d>", "<C-d>zz")
key("n", "<C-u>", "<C-u>zz")
key("n", "n", "nzzzv")
key("n", "N", "Nzzzv")
key("n", "dw", "daw")

-- greatest remap ever
key("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
key("n", "<leader>y", "\"+y")
key("v", "<leader>y", "\"+y")
key("n", "<leader>Y", "\"+Y")

key("n", "<leader>d", "\"_d")
key("v", "<leader>d", "\"_d")

-- This is going to get me cancelled
key("i", "<C-c>", "<Esc>")

key("n", "Q", "<nop>")
key("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
key("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

key("n", "<C-k>", "<cmd>cnext<CR>zz")
key("n", "<C-j>", "<cmd>cprev<CR>zz")
key("n", "<leader>k", "<cmd>lnext<CR>zz")
key("n", "<leader>j", "<cmd>lprev<CR>zz")

key("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
key("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- #############
-- # NVIM-TREE #
-- #############

key("n", "<C-a>", ":NvimTreeToggle<CR>", full_options)
key("n", "<C-f>", ":NvimTreeFindFile<CR>", full_options)
