return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      {
        "nvimdev/lspsaga.nvim",
        opts = {
          symbol_in_winbar = { enable = false },
          ui = { code_action = "" },
        },
        keys = {
        },
      },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = { library = { "lazy.nvim" } },
      },
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      vim.lsp.config("bashls", {
        filetypes = { "bash", "sh", "zsh" },
      })
      vim.lsp.config("lua_ls", {
        on_init = function(client)
          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT',
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          })
        end,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
          }
        },
      })
      vim.lsp.config("powershell_es", {
        filetypes = { "ps1", "psm1", "psd1" },
        bundle_path = "~/PowerShellEditorServices",
        init_options = {
          enableProfileLoading = false,
        },
      })
      vim.lsp.enable({
        "lua_ls",
        "gopls",
        "bashls",
        "powershell_es",
        "html",
        "tailwindcss",
        "cssls",
        "jsonls",
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup('UserLspStartTs', { clear = true }),
        callback = function(ev)
          if not vim.tbl_contains(
            {
              "javascript",
              "javascriptreact",
              "javascript.jsx",
              "typescript",
              "typescriptreact",
              "typescript.tsx",
            },
            ev.match
          ) then
            return
          end
          if vim.fn.findfile("package.json", ".;") ~= "" then
            vim.lsp.enable({"ts_ls"})
            return
          end
          vim.lsp.enable({"denols"})
        end,
      })
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local bufopts = { noremap = true, silent = true, buffer = ev.buf }
          vim.keymap.set("n", "<C-]>", "<Cmd>Lspsaga goto_definition<CR>", bufopts)
          vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
          vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
          vim.keymap.set({"n", "t"}, "<Leader>t", "<cmd>Lspsaga term_toggle<CR>", bufopts)
          vim.keymap.set(
            "n",
            "K",
            "<Cmd>Lspsaga hover_doc<CR>",
            bufopts
          )
          vim.keymap.set(
            "n",
            "<Leader>o",
            "<cmd>Lspsaga outline<CR>",
            bufopts
          )
          vim.keymap.set(
            "n",
            "<Leader>c",
            "<cmd>Lspsaga code_action<CR>",
            bufopts
          )
          vim.keymap.set(
            "n",
            "<Leader>da",
            "<cmd>Lspsaga show_buf_diagnostics<CR>",
            bufopts
          )
          vim.keymap.set(
            "n",
            "<Leader>dl",
            "<cmd>Lspsaga show_line_diagnostics<CR>",
            bufopts
          )
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      win = {
        wo = {
          wrap = true,
        },
      },
    },
    keys = {
      {
        "<Leader>xx",
        "<cmd>Trouble diagnostics toggle<CR>",
        desc = "Diagnostics (Trouble)",
      }
    },
  },
}
