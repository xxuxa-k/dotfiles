return {
  "gbprod/substitute.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = {},
  keys = {
    {
      "s", function()
        require("substitute").operator()
      end,
      {
        desc = "Substitute with motion",
      },
    },
    {
      "ss", function()
        require("substitute").line()
      end,
      {
        desc = "Substitute line",
      },
    },
    {
      "S", function()
        require("substitute").eol()
      end, {
        desc = "Substitute to end of line"
      },
    },
    {
      "s", function()
        require("substitute").visual()
      end, mode = "x", {
        "Substitute in visual mode"
      },
    },
  },
}
