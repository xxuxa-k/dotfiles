vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = { noremap = true, silent = true }

vim.keymap.set(
  "n",
  "<Esc><Esc>",
  "<cmd>noh<CR>",
  vim.tbl_extend("force", opts, { desc = "noh" })
)
vim.keymap.set(
  "n",
  "<Leader>w",
  "<cmd>w<CR>",
  vim.tbl_extend("force", opts, { desc = "w!" })
)
vim.keymap.set(
  "n",
  "<Leader>q",
  "<cmd>q!<CR>",
  vim.tbl_extend("force", opts, { desc = "q!"})
)
vim.keymap.set("n", "<Leader>pf", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied to clipboard: " .. path)
end, vim.tbl_extend("force", opts, { desc = "Copy file absolute path" }))

