return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "gbrlsnchs/telescope-lsp-handlers.nvim",
    },
    keys = {
      {
        "<leader>ff",
        ":Telescope find_files --hidden=false<CR>",
        silent = true,
        desc = "Find files",
      },
      {
        "<leader>fg",
        ":Telescope live_grep<CR>",
        silent = true,
        desc = "grep files",
      },
      {
        "<leader>fs",
        ":Telescope grep_string<CR>",
        silent = true,
        desc = "Find string under cursor in cwd",
      },
      {
        "<leader>fb",
        ":Telescope buffers<CR>",
        desc = "buffers",
      },
      {
        "<leader>fr",
        ":Telescope registers<CR>",
        desc = "registers",
      },
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            ".git",
            "dist",
            "yarn.lock",
          },
        },
        pickers = {
          find_files = {
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--glob",
              "!**/.git/*",
            },
          },
        },
        extensions = {
          lsp_handlers = {
            disable = {},
            location = {
              telescope = {},
              no_results_message = "No locations found",
            },
            symbol = {
              telescope = {},
              no_results_message = "No symbols found",
            },
            call_hierarchy = {
              telescope = {},
              no_results_message = "No calls found",
            },
            code_action = {
              telescope = require("telescope.themes").get_dropdown({}),
              no_results_message = "No code actions available",
              prefix = " ",
            },
          }
        },
      })
      telescope.load_extension("lsp_handlers")
    end,
  },
}
