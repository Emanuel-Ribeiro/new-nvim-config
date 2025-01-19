return {
	-- Gerenciador de LSPs e ferramentas
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"ts_ls", -- TypeScript/JavaScript
					"bashls", -- Bash
					"cssls", -- CSS
					"dockerls", -- Docker
					"jsonls", -- JSON
					"helm_ls", -- Helm
					"nginx_language_server", -- NGINX
					"terraformls", -- Terraform (funciona com Terragrunt)
					"tflint", -- TFLint
					"yamlls", -- YAML
				},
			})
		end,
	},
	-- Configuração principal do LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Configurações comuns para todos os servidores
			local servers = {
				lua_ls = {}, -- Lua
				ts_ls = {}, -- TypeScript/JavaScript
				bashls = {}, -- Bash
				cssls = {}, -- CSS
				dockerls = {}, -- Docker
				jsonls = {}, -- JSON
				helm_ls = {}, -- Helm
				nginx_language_server = {}, -- NGINX
				yamlls = {}, -- YAML
			}

			for server, opts in pairs(servers) do
				lspconfig[server].setup(vim.tbl_extend("force", {
					capabilities = capabilities,
				}, opts))
			end

			-- Configuração específica para Terraform e Terragrunt
			lspconfig.terraformls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = true
					vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { buffer = bufnr, desc = "Format Terraform" })
				end,
				filetypes = { "terraform", "terragrunt" }, -- Adiciona suporte ao Terragrunt
				settings = {
					terraform = {
						experiments = {
							enableModuleCompletion = true, -- Habilita autocomplete para módulos
						},
					},
				},
			})

			-- Configuração do TFLint (Linter para Terraform/Terragrunt)
			lspconfig.tflint.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostics" })
				end,
			})

			-- Atalhos globais para LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

			-- Atalhos específicos para Terragrunt
			vim.keymap.set("n", "<leader>tgp", ":!terragrunt plan<CR>", { desc = "Terragrunt Plan" })
			vim.keymap.set("n", "<leader>tga", ":!terragrunt apply<CR>", { desc = "Terragrunt Apply" })
			vim.keymap.set("n", "<leader>tgi", ":!terragrunt init<CR>", { desc = "Terragrunt Init" })
		end,
	},
}

