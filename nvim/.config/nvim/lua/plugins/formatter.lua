return {
	{ "mhartington/formatter.nvim",
		config = function ()
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
				}
			})
		end,
	},
}
