## Neovim Documentation

### Config File Locations:
- `init.lua` -> `~/.config/nvim/init.lua`
  contains the common configuration for the neovim. The plugin configuration are moved to separate files. For example, `nerdtree.vim` contains the configuration for the NerdTree plugin. 

- `lua/nerdtree.lua` -> `~/.config/nvim/lua/nerdtree.lua`
- `lua/statusline.lua` -> `~/.config/nvim/lua/statusline.lua`
- `lua/ctrlp.lua` -> `~/.config/nvim/lua/ctrlp.lua`


### [vim-plug](https://github.com/junegunn/vim-plug)

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### More info

More documentation is present in the [vim directory](../../vim/).

### Script

```bash
set -ex

# Install neovim
sudo apt install neovim curl git

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Create directories
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua

# Copy the init.vim file
cp nvim/init.lua ~/.config/nvim/init.lua

# Copy the statusline.vim file
cp nvim/lua/statusline.lua ~/.config/nvim/lua/statusline.lua

# Copy the native-autocomplete.vim file
cp nvim/lua/native-autocomplete.lua ~/.config/nvim/lua/native-autocomplete.lua

# Copy the nerdtree.vim file
cp nvim/lua/nerdtree.lua ~/.config/nvim/lua/nerdtree.lua

# Copy the ctrlp.vim file
cp nvim/lua/ctrlp.lua ~/.config/nvim/lua/ctrlp.lua
```
