return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = false,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatStop",
      "CopilotChatReset",
    },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-telescope/telescope.nvim" },
      { "hrsh7th/nvim-cmp" },
    },
    keys = {
      {
        "<leader>cc",
        "<Cmd>CopilotChat<CR>",
        mode = { "n", "x" },
        desc = "CopilotChat Open chat window",
      },
    },
    config = function()
      require("CopilotChat").setup()
    end,
  }
}
