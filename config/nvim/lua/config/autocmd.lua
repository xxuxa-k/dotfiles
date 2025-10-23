
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"json","yaml"},
  callback = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldlevelstart = 99
    vim.opt.foldlevel = 1
    vim.opt.foldenable = true
  end,
})
