return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      {
        "<leader><leader>",
        "<cmd>Noice dismiss<CR>",
        desc = "Dismiss Noice messages",
      },
    },
    opts = {
      messages = {
        view = "mini",
      },
    },
  },
}
