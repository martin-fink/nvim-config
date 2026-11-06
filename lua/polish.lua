-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Move by display lines when wrapping, unless a count is given (e.g. 5j)
local opts = { expr = true, silent = true }
for _, mode in ipairs { "n", "x" } do
  vim.keymap.set(mode, "j", "v:count == 0 ? 'gj' : 'j'", opts)
  vim.keymap.set(mode, "k", "v:count == 0 ? 'gk' : 'k'", opts)
  vim.keymap.set(mode, "<Down>", "v:count == 0 ? 'gj' : 'j'", opts)
  vim.keymap.set(mode, "<Up>", "v:count == 0 ? 'gk' : 'k'", opts)
end
vim.keymap.set("i", "<Down>", "<C-o>gj", { silent = true })
vim.keymap.set("i", "<Up>", "<C-o>gk", { silent = true })

-- Soft-wrap prose files at word boundaries
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})
