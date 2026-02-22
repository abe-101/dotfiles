-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = ""

-- https://github.com/LazyVim/LazyVim/issues/1319#issuecomment-1681644431
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
-- https://www.reddit.com/r/neovim/comments/1arkhtx/comment/kqqz5g4/
vim.g.autoformat = false
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"

-- Disable legacy Python 3 provider. The built-in ftplugin/python.vim calls
-- has('python3') which triggers detect_by_module('neovim') — a ~6s scan in
-- large repos. Not needed when using LSP for completion/diagnostics.
vim.g.loaded_python3_provider = 0
