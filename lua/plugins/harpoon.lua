return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon_mark = require("harpoon.mark")
			local harpoon_ui = require("harpoon.ui")

			-- Adicionar arquivo ao Harpoon
			vim.keymap.set("n", "<leader>a", harpoon_mark.add_file, { desc = "Add file to Harpoon" })

			-- Abrir o menu rápido do Harpoon
			vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })

			-- Navegação entre os arquivos marcados
			vim.keymap.set("n", "<C-h>", function() harpoon_ui.nav_file(1) end, { desc = "Go to Harpoon file 1" })
			vim.keymap.set("n", "<C-j>", function() harpoon_ui.nav_file(2) end, { desc = "Go to Harpoon file 2" })
			vim.keymap.set("n", "<C-k>", function() harpoon_ui.nav_file(3) end, { desc = "Go to Harpoon file 3" })
			vim.keymap.set("n", "<C-l>", function() harpoon_ui.nav_file(4) end, { desc = "Go to Harpoon file 4" })

			-- Substituir os arquivos na posição correspondente
			vim.keymap.set("n", "<leader><C-h>", function() harpoon_mark.set_current_at(1) end, { desc = "Replace Harpoon file 1" })
			vim.keymap.set("n", "<leader><C-j>", function() harpoon_mark.set_current_at(2) end, { desc = "Replace Harpoon file 2" })
			vim.keymap.set("n", "<leader><C-k>", function() harpoon_mark.set_current_at(3) end, { desc = "Replace Harpoon file 3" })
			vim.keymap.set("n", "<leader><C-l>", function() harpoon_mark.set_current_at(4) end, { desc = "Replace Harpoon file 4" })
		end,
	},
}

