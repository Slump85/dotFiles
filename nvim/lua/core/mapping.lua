vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w <Cr>")
vim.keymap.set("n", "<leader>q", ":q <Cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format { async = true }
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- switch between windows
vim.keymap.set("n","<C-h>", "<C-w>h")
vim.keymap.set("n","<C-l>", "<C-w>l")
vim.keymap.set("n","<C-j>", "<C-w>j")
vim.keymap.set("n","<C-k>", "<C-w>k")

-- NvimTree
-- toggle
vim.keymap.set("n", "<leader>pv", "<cmd> NvimTreeToggle <CR>")
-- focus
vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>")

-- barbar
vim.keymap.set("n", "<Tab>", "<cmd> BufferNext <CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd> BufferPrev <CR>")
vim.keymap.set("n", "<A-l>", "<cmd> BufferMoveNext <CR>")
vim.keymap.set("n", "<A-h>", "<cmd> BufferMovePrev <CR>")
--vim.keymap.set("n", "<leader>x", "<cmd> bd <CR>")
