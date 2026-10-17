vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterConfig', { clear = true }),
  pattern = {
    'go', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
    'rust', 'python', 'html', 'css', 'scss', 'lua', 'sh', 'json', 'toml', 'markdown',
  },
  callback = function()
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end,
})
