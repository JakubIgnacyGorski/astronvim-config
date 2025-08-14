-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function() vim.cmd "RustFmt" end,
})
