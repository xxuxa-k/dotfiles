return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "gbrlsnchs/telescope-lsp-handlers.nvim",
      "nullromo/telescope-box-drawing.nvim",
    },
    keys = {
      {
        "<Leader>ff",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            hidden = true,
          })
        end,
        desc = "Find files",
      },
      {
        "<Leader>fg",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "grep files",
      },
      {
        "<Leader>fs",
        function()
          local builtin = require("telescope.builtin")
          builtin.grep_string()
        end,
        desc = "Find string under cursor in cwd",
      },
      {
        "<Leader>fb",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers({
            show_all_buffers = true,
            only_cwd = true,
          })
        end,
        desc = "Find buffers",
      },
      {
        "<Leader>fr",
        function()
          local builtin = require("telescope.builtin")
          builtin.registers()
        end,
        desc = "Find registers",
      },
      {
        "<Leader>fc",
        function()
          local builtin = require("telescope.builtin")
          builtin.commands()
        end,
        desc = "Find commands",
      },
      {
        "<Leader>ft",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter({
            show_line = true,
          })
        end,
        desc = "List functions, variables",
      },
      {
        "<Leader>fl",
        function()
          local builtin = require("telescope.builtin")
          builtin.current_buffer_fuzzy_find({
            skip_empty_lines = true,
          })
        end,
        desc = "current_buffer_fuzzy_find",
      },
    },
    opts = {
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
        },
        ["box-drawing"] = require("telescope.themes").get_cursor({
          layout_config = {
            height = 20,
            width = 40,
          },
        }),
      },
    },
    config = function()
      local telescope = require('telescope')
      telescope.load_extension("lsp_handlers")
      telescope.load_extension("box-drawing")
    end,
  },
}
