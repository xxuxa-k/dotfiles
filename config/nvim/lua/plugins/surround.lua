return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function()
    -- https://github.com/kylechui/nvim-surround?tab=readme-ov-file#rocket-usage
		require("nvim-surround").setup()
	end,
}
