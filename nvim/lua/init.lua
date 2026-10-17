require('minimal')

-- Additional settings for the full configuration.
vim.opt.clipboard = 'unnamedplus'

-- Plugins (requires Neovim 0.12 or newer).
vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'd4a9b23a383266bdb0bfb42d565f31e83f27be5e'
  },
  {
    src = 'https://github.com/preservim/nerdtree',
    version = '7.1.3'
  },
  { 
    src = 'https://github.com/vim-airline/vim-airline',
    version = 'v0.12'
  },
  {
    src = 'https://github.com/vim-airline/vim-airline-themes',
    version = '77aab8c6cf7179ddb8a05741da7e358a86b2c3ab',
  },
  {
    src = 'https://github.com/junegunn/fzf',
    version = 'v0.74.5'
  },
  {
    src = 'https://github.com/junegunn/fzf.vim',
    version = '023de3c0e158ff9c2b0992175af10be97c2f2158',
  },
})

require('treesitter-config')
require('nerdtree')
require('fzf-config')
