---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-c>"] = { "<cmd> noh <CR>", "Clear hightlight" },
    ["<leader>w"] = { "<cmd> w <CR>", "save" },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
