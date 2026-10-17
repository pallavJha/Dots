
<h2 align="center">
<img height="25 width="25" src="../neovim.svg"/>
<br/>
<a href="/vim">Neovim Documentation</a>
</h2>

### Table of Contents:

- [Config File Locations](#config-file-locations)
- [Minimal Configuration](#minimal-configuration)
- [Plugin Manager](#plugin-manager)
- [nvim-treesitter](#nvim-treesitter)
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
- `lua/treesitter-config.lua` -> `~/.config/nvim/lua/treesitter-config.lua`

### Minimal Configuration

`minimal.lua` uses only Neovim's built-in features and bundled Retrobox theme. To use it directly, run:

```bash
nvim -u path/to/minimal.lua
```

### Plugin Manager

- Plugins are managed using Neovim's built-in
[vim.pack](https://neovim.io/doc/user/pack/#vim.pack). Requires Neovim 0.12 or
newer and Git.

- The following plugins are used:
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
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
  - Note: Neovim saves installed revisions in `~/.config/nvim/nvim-pack-lock.json`.

### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Syntax highlighting and folding using language parsers.
Configuration is present in `lua/treesitter-config.lua`.

#### Installation Steps

Requires Neovim 0.12 or newer, `tar`, `curl`, a C compiler and [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) 0.26.1 or newer.

```bash
# macOS
brew install tree-sitter-cli

# C compiler (if not already installed)
xcode-select --install
```

After installing the plugin, install the parsers:

```vim
:TSInstall go javascript typescript tsx rust python html css scss lua bash json toml markdown markdown_inline
```

After updating `nvim-treesitter`, update its parsers:

```vim
:TSUpdate
```

#### Shortcuts

- `za`: Toggle a fold
- `zo`: Open a fold
- `zc`: Close a fold
- `zR`: Open all folds
- `zM`: Close all folds

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

```bash
# macOS
brew install ripgrep

# Ubuntu
sudo apt install ripgrep
```

Find in Files searches beneath Neovim's current directory as you type. It
respects `.gitignore` and `.ignore`, includes hidden files, and skips `.git`,
`node_modules`, `vendor`, `dist`, `build` and `.venv` directories. Searches match
literal text, ignoring case unless the query contains uppercase letters.

#### Shortcuts

- `<C-p>`: Find files in the current directory
- `<C-h>`: Find text in files
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
|`:FindInFiles [text]`|Search literal text in files interactively|


### Installation Commands

- Install `neovim`
  ```bash
  # Ubuntu
  sudo apt install neovim curl git fzf

  # MacOS
  brew install neovim
  brew install fzf
  brew install tree-sitter-cli
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

  # Copy the Tree-sitter configuration
  cp nvim/lua/lua/treesitter-config.lua ~/.config/nvim/lua/treesitter-config.lua
  ```

- Open `nvim` and confirm the plugin installation.
- Install the `tree-sitter` parsers.

### Screenshot(s)

![image](https://user-images.githubusercontent.com/4998915/170875225-0119b0a7-ae3b-4765-a831-c9360d311c52.png)
