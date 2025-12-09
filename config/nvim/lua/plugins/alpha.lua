return {
  {
    "goolord/alpha-nvim",
    event = {
      "VimEnter",
    },
    dependencies = {
      "nvim-mini/mini.icons",
    },
    config = function()
      local theme = require("alpha.themes.startify")
      require("alpha").setup(theme.config)
    end
  },
}
