return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {},
    },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "gopls",
    },
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)

    vim.o.pumborder = "rounded"
    vim.opt.completeopt = { "menuone", "noselect", "noinsert", "fuzzy", "popup", "preview" }
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method('textDocument/completion') then
          vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
      end,
    })
  end,
}
