vim.keymap.set('n', '<C-p>', '<cmd>Files<CR>', {
	silent = true,
	desc = 'Find files with fzf'
})

-- Search file contents, respecting ignore files and excluding generated files.
vim.api.nvim_create_user_command('FindInFiles', function(args)
  local command = 'rg --column --line-number --no-heading --color=always'
    .. ' --smart-case --fixed-strings --hidden'
    .. " --glob '!.git' --glob '!node_modules' --glob '!vendor'"
    .. " --glob '!dist' --glob '!build' --glob '!.venv' -- "
  vim.fn['fzf#vim#grep2'](command, args.args, vim.fn['fzf#vim#with_preview']())
end, { nargs = '*', desc = 'Find text in files with fzf' })

vim.keymap.set('n', '<C-h>', '<cmd>FindInFiles<CR>', {
  silent = true,
  desc = 'Find text in files',
})
