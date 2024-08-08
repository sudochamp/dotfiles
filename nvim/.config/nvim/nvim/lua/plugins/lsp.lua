return {
	--- Uncomment the two plugins below if you want to manage the language servers from neovim
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		config = function ()
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({buffer = bufnr})
			end)
			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,
				},
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				}

			})
			--- require('lspconfig').lua_ls.setup({})
		end,
	},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp',
		config = function ()
			local cmp = require('cmp')
			cmp.setup({
				preselect = 'item',
				completion = {
					completeopt = 'menu,menuone,noinsert',
					autocomplete = false
				},
				sources = {
					{name = 'nvim_lsp'},
				},
				mapping = {
					['<CR>'] = cmp.mapping.confirm({select = false}),
					['<C-e>'] = cmp.mapping.abort(),
					['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
					['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
					['<C-p>'] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item({behavior = 'insert'})
						else
							cmp.complete()
						end
					end),
					['<C-n>'] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_next_item({behavior = 'insert'})
						else
							cmp.complete()
						end
					end),
					['<C-Space>'] = cmp.mapping.complete(),
				},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
			})
		end,
	},
	{'L3MON4D3/LuaSnip'},
}

