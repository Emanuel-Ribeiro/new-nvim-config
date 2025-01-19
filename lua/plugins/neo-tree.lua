return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Definir a largura inicial do NeoTree
    require("neo-tree").setup({
      window = {
        width = 24,  -- Defina a largura da janela ao abrir (ajuste conforme necessário)
      },
    })

    -- Definir o comportamento de alternância do NeoTree (abrir/fechar)
    vim.keymap.set('n', '<leader>e', function()
      vim.cmd("Neotree toggle")
    end, { desc = '[E]xplorador de arquivos' })
  end
}

