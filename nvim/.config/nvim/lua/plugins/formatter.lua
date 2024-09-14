return {
	{
		"mhartington/formatter.nvim",
		config = function()
			local util = require("formatter.util")

			require("formatter").setup({
				logging = false,
				filetype = {
					javascript = {
						function()
							return {
								exe = "prettierd",
								args = { vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					typescriptreact = {
						function()
							return {
								exe = "prettierd",
								args = { vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					typescript = {
						function()
							return {
								exe = "prettierd",
								args = { vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,

						function()
							return {
								exe = "stylua",
								args = {
									"--search-parent-directories",
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
									"--",
									"-",
								},
								stdin = true,
							}
						end,
					},
					svelte = {
						function()
							return {
								exe = "prettierd",
								args = { vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
				},
			})
		end,
	},
}
