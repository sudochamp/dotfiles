return {
	--- Uncomment the two plugins below if you want to manage the language servers from neovim
	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup({})
		end,
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		config = function()
			local lsp_zero = require("lsp-zero")

			local lsp_attach = function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end

			lsp_zero.extend_lspconfig({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				lsp_attach = lsp_attach,
				float_border = "rounded",
				sign_text = true,
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer" },
				handlers = {
					function(server_name)
						if server_name == "tsserver" then
							server_name = "ts_ls"
						end
						require("lspconfig")[server_name].setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()
			local cmp_format = require("lsp-zero").cmp_format({ details = true })
			cmp.setup({
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
					autocomplete = false,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "supermaven" },
					{ name = "buffer" },
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					-- ['<C-e>'] = cmp.mapping.abort(),
					-- ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
					-- ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
					-- ['<C-p>'] = cmp.mapping(function()
					-- 	if cmp.visible() then
					-- 		cmp.select_prev_item({behavior = 'insert'})
					-- 	else
					-- 		cmp.complete()
					-- 	end
					-- end),
					-- ['<C-n>'] = cmp.mapping(function()
					-- 	if cmp.visible() then
					-- 		cmp.select_next_item({behavior = 'insert'})
					-- 	else
					-- 		cmp.complete()
					-- 	end
					-- end),
					-- ['<C-Space>'] = cmp.mapping.complete(),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = cmp_format,
			})
		end,
	},
	{ "L3MON4D3/LuaSnip" },
	{
		"VidocqH/lsp-lens.nvim",
		config = function()
			require("lsp-lens").setup({})
		end,
	},
}
