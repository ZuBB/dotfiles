-- rebase_todo_cleaner.lua
--
-- Colorschemes for specific filetypes
local ft_colors = {
  gitrebase = "zaibatsu",
  gitcommit = "wildcharm",
}

for ft, scheme in pairs(ft_colors) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.cmd.colorscheme(scheme)
    end,
  })
end


-- Automatically remove '# ' column in rebase-todo buffers

local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "git-rebase-todo", -- match filename only
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

      local new_lines = {}
      for i, line in ipairs(lines) do
        if line == "" then
          -- stop at first empty line (comments after remain untouched)
          for j = i, #lines do
            table.insert(new_lines, lines[j])
          end
          break
        end

        -- strip "# " after sha (3rd column)
        local modified = line:gsub("^(%S+%s+%S+)%s+#%s+", "%1 ")
        table.insert(new_lines, modified)
      end

      if #new_lines > 0 then
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
      end
    end,
  })
end

return M
