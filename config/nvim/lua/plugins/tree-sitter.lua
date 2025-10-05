return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "go",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "graphql",
          "markdown",
          "dockerfile",
          "editorconfig",
          "json",
          "json5",
          "powershell",
          "java",
          "scala",
        },
        modules = {},
        ignore_install = {},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
