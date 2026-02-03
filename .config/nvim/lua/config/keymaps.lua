-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set(
  "n",
  "<leader>sf",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { noremap = true, silent = true, desc = "Replace word under cursor" }
)
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>ip", function()
  vim.cmd("normal! ofrom IPython import embed; embed()")
end, { desc = "Insert IPython debugger" })
vim.keymap.set("n", "<leader>cp", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    vim.notify("No file", vim.log.levels.WARN)
    return
  end

  -- find LSP root for the current buffer
  local root
  for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    local dir = client.config.root_dir
    if dir and file:sub(1, #dir) == dir then
      root = dir
      break
    end
  end

  if not root then
    vim.notify("No LSP root found for this file", vim.log.levels.WARN)
    return
  end

  -- path relative to LSP root
  local rel = file:gsub("^" .. vim.pesc(root) .. "/", "")
  vim.fn.setreg("+", rel)
  vim.notify("Copied: " .. rel)
end, { desc = "Copy path relative to LSP root" })
