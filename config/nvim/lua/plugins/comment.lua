return {
  {
    "numToStr/Comment.nvim",
    event = {
      "VeryLazy",
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        enable_autocmd = false,
      },
    },
    config = function()
      -- TODO: fix diagnostics
      ---@diagnostic disable: missing-fields
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
      ---@diagnostic enable: missing-fields
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = {
      "VeryLazy",
    },
    opts = {},
  },
}
