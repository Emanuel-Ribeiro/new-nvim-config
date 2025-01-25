return {
  "nathanaldens/vim-hcl",
  config = function()
    -- Configura para tratar arquivos .hcl com a sintaxe de HCL
    vim.cmd [[
      autocmd BufNewFile,BufRead *.hcl set filetype=hcl
    ]]
    
    -- Define o commentstring para o HCL, já que é um arquivo de texto simples
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "hcl",
      callback = function()
        vim.bo.commentstring = "# %s"  -- Define o comentário no estilo HCL (#)
      end
    })
  end
}

