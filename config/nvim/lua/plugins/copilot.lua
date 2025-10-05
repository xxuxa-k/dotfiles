return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = false,
      },
      panel = {
        enabled = false,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    opts = {},
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
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
    opts = {},
  }
}
