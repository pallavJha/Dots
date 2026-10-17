-- Match the file finder shortcut in ~/.vimrc.
vim.keymap.set('n', '<C-p>', '<cmd>Files<CR>', { silent = true, desc = 'Find files with fzf' })
