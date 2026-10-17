## Neovim Documentation

### Table of Contents:

- [Config File Locations](#config-file-locations)
- [Plugin Manager](#plugin-manager)
- [NERDTree](#nerdtree)
- [vim-airline](#vim-airline)
- [fzf.vim](#fzfvim)
- [Installation Commands](#installation-commands)

### Config File Locations:

- `init.lua` -> `~/.config/nvim/init.lua`
  loads the common settings and plugin configuration.

- `lua/minimal.lua` -> `~/.config/nvim/lua/minimal.lua`
  contains the common settings, native completion and filetype configuration. This has been created from [minimal.nvim](../../vim/minimal.vimrc)

- `lua/nerdtree.lua` -> `~/.config/nvim/lua/nerdtree.lua`
- `lua/fzf-config.lua` -> `~/.config/nvim/lua/fzf-config.lua`

### Plugin Manager

- Plugins are managed using Neovim's built-in
[vim.pack](https://neovim.io/doc/user/pack/#vim.pack). Requires Neovim 0.12 or
newer and Git.

- The following plugins are used:
  - [NERDTree](https://github.com/preservim/nerdtree)
  - [vim-airline](https://github.com/vim-airline/vim-airline) and [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
  - [fzf](https://github.com/junegunn/fzf) and [fzf.vim](https://github.com/junegunn/fzf.vim)

- Plugins are listed in `init.lua` and installed on the first startup after confirmation.
- To pin a plugin to a Git tag, set `version`:
  ```lua
  {
    src = 'https://github.com/preservim/nerdtree',
    version = '7.1.3'
  }
  ```
  The `version` field also accepts a branch or commit hash. Plugins without release tags are pinned to commits.

  - To update plugins after changing their versions in `init.lua`, run:
  ```vim
  :lua vim.pack.update()
  ```
  - Note: Neovim saves installed revisions in `~/.config/nvim/nvim-pack-lock.json`. Keep this file with the configuration to reproduce the same plugin versions.

### [NERDTree](https://github.com/preservim/nerdtree)

File explorer.

#### Shortcuts

- `<C-n><C-n>`: Toggle NERDTree
- `<C-n><C-m>`: Find the current file in NERDTree
- `o`: Open a file or expand a directory
- `t`: Open a file in a new tab
- `i`: Open a file in a horizontal split
- `s`: Open a file in a vertical split

### [vim-airline](https://github.com/vim-airline/vim-airline)

To set a theme, add this to `init.lua`:

```lua
vim.g.airline_theme = 'dark'
```

### [fzf.vim](https://github.com/junegunn/fzf.vim)

Fuzzy finder for files, buffers and search results.

#### Installation Steps

Install the `fzf` executable:

```bash
# macOS
brew install fzf

# Ubuntu
sudo apt install fzf
```

The `junegunn/fzf` and `junegunn/fzf.vim` plugins are installed using `vim.pack`.
For searching file contents, install `ripgrep`. For syntax-highlighted previews,
install `bat`.

#### Shortcuts

- `<C-p>`: Find files in the current directory
- Type part of a filename to filter the results
- Use the arrow keys to select a result and press `Enter` to open it
- `Esc`: Close the finder
- `<C-t>`: Open in a new tab
- `<C-x>`: Open in a horizontal split
- `<C-v>`: Open in a vertical split

#### Commands

|Command|Description|
|-------|-----------|
|`:Files`|Find files in the current directory|
|`:GFiles`|Find Git-tracked files|
|`:Buffers`|Switch between open buffers|
|`:History`|Find previously opened files|
|`:Rg pattern`|Search file contents using ripgrep|


### Installation Commands

- Install `neovim`
  ```bash
  # Ubuntu
  sudo apt install neovim curl git fzf

  # MacOS
  brew install neovim
  brew install fzf
  ```
- `nvim` configuration directories and files related commands
  ```bash
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/nvim/lua
  # Copy the init.lua file
  cp nvim/lua/init.lua ~/.config/nvim/init.lua

  # Copy the minimal settings
  cp nvim/lua/lua/minimal.lua ~/.config/nvim/lua/minimal.lua

  # Copy the NERDTree configuration
  cp nvim/lua/lua/nerdtree.lua ~/.config/nvim/lua/nerdtree.lua

  # Copy the fzf key mapping
  cp nvim/lua/lua/fzf-config.lua ~/.config/nvim/lua/fzf-config.lua
  ```

- Open `nvim` and confirm the plugin installation.

### Screenshot(s)

![image](https://user-images.githubusercontent.com/4998915/170875225-0119b0a7-ae3b-4765-a831-c9360d311c52.png)
