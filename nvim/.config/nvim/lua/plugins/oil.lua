return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
					"permissions",
					"size",
					"mtime",
				},

				delete_to_trash = true,
				lsp_file_methods = {
					enabled = true,
					timeout_ms = 1000,
					autosave_changes = false,
				},
				watch_for_changes = true,
				use_default_keymaps = true,
				view_options = {
					show_hidden = true,

					is_hidden_file = function(name, bufnr)
						return vim.startswith(name, ".")
					end,
					is_always_hidden = function(name, bufnr)
						return false
					end,
					natural_order = true,
					case_insensitive = true,
				},
			})
		end,
	},
	{
		"adelarsq/image_preview.nvim",
		event = "VeryLazy",
		dependencies = {
			"stevearc/oil.nvim",
		},
		config = function()
			require("image_preview").setup()
		end,
	},
}
