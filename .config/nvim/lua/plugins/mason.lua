return {
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
        require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "ruff", "basedpyright" },
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
	  	    analysis = {
                typeCheckingMode = "standard",
 	  	    },
            },
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- python
      vim.lsp.config('basedpyright', {
      })
      vim.lsp.enable('basedpyright')

      vim.lsp.config('ruff', {
        init_options = {
          settings = {
            logLevel = 'debug',
            -- Ruff language server settings go here
          }
        }
      })

      vim.lsp.enable('ruff')

      vim.lsp.config('gopls', {
      })

      vim.lsp.enable('gopls')

      vim.lsp.config('yamlls', {
      })

      vim.lsp.enable('yamlls')

      vim.lsp.config('jsonls', {
      })

      vim.lsp.enable('jsonls')

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {} )
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {} )
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {} )
    end
  }
}
