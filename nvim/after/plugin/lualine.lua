local lualine_status, lualine = pcall(require, 'lualine')
if not lualine_status then
	return
end

lualine.setup({
	options = {
		theme = 'tokyonight', -- nightfly, nord, grubbox_dark, material, tokyonight
		disabled_filetypes = {
			statusline = { 'dashboard', 'NvimTree' },
			winbar = { 'dashboard', 'NvimTree' }
		}
	},
	sections = {
		lualine_a =  { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = { 'fugitive', 'fzf', 'quickfix' }
})
