-- Fuzzy finder
return {
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  lazy = true,
  branch = '0.1.x',
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    { 'nvim-lua/plenary.nvim' },
    {
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  opts = {
    defaults = {
      layout_config = {
        vertical = {
          width = 0.75
        }
      }
    }
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function ()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
