vim.api.nvim_create_user_command("LoadAllFilesForDiagnostics", function()
  local cwd = vim.fn.getcwd()
  local filename = vim.api.nvim_buf_get_name(0)
  local ext = filename:match "^.+(%..+)$" or ""
  local pattern = "**/*" .. ext

  -- List of excluded directories
  local exclude_dirs = { "/%.git/", "/build/" }

  local all_files = vim.fn.globpath(cwd, pattern, true, true)

  local files = vim.tbl_filter(function(file)
    for _, pattern in ipairs(exclude_dirs) do
      if file:find(pattern) then return false end
    end
    return true
  end, all_files)

  for _, file in ipairs(files) do
    vim.cmd("silent! edit " .. vim.fn.fnameescape(file))
  end

  vim.diagnostic.setloclist { open = true }
end, { desc = "Load all files with current file extension for diagnostics" })
