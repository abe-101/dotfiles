if vim.fn.has("macunix") ~= 1 then
  return {}
end

return {
  {
    "octoenergy/kraken.nvim",
    opts = {},
  },
}
