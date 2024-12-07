return {
	{
		"mhartington/formatter.nvim",
		config = function()
			local util = require("formatter.util")

			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.DEBUG,
				filetype = {
					typescriptreact = {
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
						require("formatter.filetypes.svelte").svelte,

						function()
							return {
								exe = "prettier",
								args = {
									"--config-precedence",
									"prefer-file",
									"--single-quote",
									"--no-bracket-spacing",
									"--prose-wrap",
									"always",
									"--arrow-parens",
									"always",
									"--trailing-comma",
									"all",
									"--no-semi",
									"--end-of-line",
									"lf",
									"--print-width",
									vim.bo.textwidth,
									"--stdin-filepath",
									vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
								},
								stdin = true,
							}
						end,
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
		end,
	},
}
