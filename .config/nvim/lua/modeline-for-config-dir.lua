vim.api.nvim_create_augroup('ConfigModeline', { clear = true })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'ConfigModeline',
  pattern = vim.fn.expand('~/.config') .. '/*',
  callback = function()
    vim.opt_local.modeline = true
  end,
})

