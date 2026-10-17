-- Plugin-free settings translated from vim/minimal.vimrc.
local opt = vim.opt

-- Show the full file path in the status line.
opt.statusline:append('%F')
vim.keymap.set('i', '<C-w>', '<Nop>')

opt.background = 'dark'
vim.cmd.colorscheme('retrobox')
vim.cmd.syntax('enable')

opt.number = true
opt.incsearch = true
opt.hlsearch = true
opt.listchars = {
  tab = '>-',
  trail = '-',
  nbsp = '%',
  extends = '>',
  precedes = '<',
  eol = '¬',
}
opt.shiftwidth = 2
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.swapfile = false

-- Neovim always uses UTF-8 internally.
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.cmdheight = 2
opt.updatetime = 300
opt.shortmess:append('c')
opt.signcolumn = 'number'
opt.mouse = 'a'

-- Syntax folding.
opt.foldmethod = 'syntax'
vim.g.javaScript_fold = 1
opt.foldcolumn = '0'
opt.foldlevel = 5
opt.foldlevelstart = 8
opt.foldclose = 'all'

-- Native completion: use arrows to navigate and accept suggestions.
opt.complete:append('kspell')
opt.completeopt = { 'menuone', 'longest' }
for key, completion_key in pairs({
  ['<Down>'] = '<C-n>',
  ['<Up>'] = '<C-p>',
  ['<Right>'] = '<C-y>',
  ['<CR>'] = '<C-y>',
}) do
  vim.keymap.set('i', key, function()
    return vim.fn.pumvisible() == 1 and completion_key or key
  end, { expr = true })
end

-- Terminal tab line colors.
vim.api.nvim_set_hl(0, 'TabLine', { ctermfg = 'Green', ctermbg = 'Black' })
vim.api.nvim_set_hl(0, 'TabLineFill', { ctermfg = 'Grey', ctermbg = 'Black' })
vim.api.nvim_set_hl(0, 'TabLineSel', { ctermfg = 'Green', ctermbg = 'Black' })

local group = vim.api.nvim_create_augroup('MinimalFileSettings', { clear = true })

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = group,
  pattern = '*.svelte',
  callback = function()
    vim.bo.filetype = 'html'
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = group,
  pattern = '*.py',
  callback = function()
    local buf = vim.opt_local
    buf.tabstop = 4
    buf.softtabstop = 4
    buf.shiftwidth = 4
    buf.textwidth = 79
    buf.expandtab = true
    buf.autoindent = true
    buf.fileformat = 'unix'
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = group,
  pattern = { '*.js', '*.ts', '*.html', '*.svelte', '*.css', '*.scss' },
  callback = function()
    local buf = vim.opt_local
    buf.tabstop = 2
    buf.softtabstop = 2
    buf.shiftwidth = 2
  end,
})
