-- Auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Automatically source and re-sync packer when you save `packer.lua`.
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerSync",
	group = packer_group,
	pattern = vim.fn.expand("packer.lua"),
})

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

local packer_util_ok, packer_util = pcall(require, "packer.util")
if not packer_util_ok then
	return
end

packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({
		'folke/tokyonight.nvim',
		as='tokyonight',
		config = function()
			vim.cmd('colorscheme tokyonight-moon')
		end
	})

	-- TREESITTER => colorisation de la syntaxe
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- Git inegration
	use('tpope/vim-fugitive')

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
	-- NVIM TREE
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- Comment => easy way to comment code
	use("numToStr/Comment.nvim")

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Colorizer
	use('NvChad/nvim-colorizer.lua')


	-- Dashboard
		use({
			"glepnir/dashboard-nvim",
			event = "VimEnter",
			config = function()
				local ts_builtin_status, ts_builtin = pcall(require, "telescope.builtin")
				if not ts_builtin_status then
					return
				end

				local ts_themes_status, ts_themes = pcall(require, "telescope.themes")
				if not ts_themes_status then
					return
				end

				-- If you want to display Neovim loaded packages in footer instead of header.
				-- local plugins_count =
				-- 	vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

				require("dashboard").setup({
					theme = "hyper",
					config = {
						header = {
							" ",
							" ",
							" ",
							" ____ ____ ____ ____ ____ ____ ",
							"||N |||E |||O |||V |||I |||M ||",
							"||__|||__|||__|||__|||__|||__||",
							"|/__\\|/__\\|/__\\|/__\\|/__\\|/__\\|",
							" ",
							" ",
							" ",
						},
						week_header = { enable = false },
						shortcut = {
							{ desc = "✅ Packer", group = "@property", action = "PackerSync", key = "p" },
							{ desc = "✅ Mason", group = "@property", action = "Mason", key = "m" },
							{ desc = "✅ TS", group = "@property", action = "TSUpdate", key = "t" },
							{
								desc = "🔍 Files",
								group = "Label",
								action = function()
									ts_builtin.find_files({
										cwd = vim.fn.substitute(vim.fn.getcwd(), "/home/slump", "~", ""),
										prompt_title = "🌞 "
											.. vim.fn.substitute(vim.fn.getcwd(), "/home/slump", "~", ""),
										hidden = true,
									})
								end,
								key = "f",
							},
							{
								desc = "💻 Dev",
								group = "Label",
								action = function()
									ts_builtin.find_files({
										cwd = "~/Flo/Dev",
										prompt_title = "💻 Dev",
										hidden = true,
									})
								end,
								key = "d",
							},
							{
								desc = "🔧 Dot",
								group = "Label",
								action = function()
									if
										pcall(function()
											ts_builtin.git_files(ts_themes.get_dropdown({
												cwd = "~/Flo/Dotfiles",
												prompt_title = " Dotfiles",
												hidden = true,
												previewer = false,
											}))
										end)
									then
									else
										ts_builtin.find_files(ts_themes.get_dropdown({
											prompt_title = " Dotfiles",
											cwd = "~/Flo/Dotfiles",
											previewer = false,
										}))
									end
								end,
								key = "o",
							},
						},
						packages = { enable = true },
						project = { limit = 0, action = "Telescope find_files cwd=" },
						mru = { limit = 0 },
						footer = {
							" ",
							" ",
							" ",
							"Bienvenue DrSlump !",
							" ",
							os.date("%A %d/%m/%Y %H:%M"),
							-- " ",
							-- "Neovim plugins: " .. plugins_count, -- display neovim loaded packages.
						},
					},
				})
			end,
			require = { { "nvim-tree/nvim-web-devicons" } },
		})

end)
