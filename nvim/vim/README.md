## Neovim Documentation

### Config File Locations:
- `init.vim` -> `~/.config/nvim/init.vim`
  contains the common configuration for the neovim. The plugin configuration are moved to separate files. For example, `nerdtree.vim` contains the configuration for the NerdTree plugin. 

- `nerdtree.vim` -> `~/.config/nvim/nerdtree.vim`
- `statusline.vim` -> `~/.config/nvim/statusline.vim`
- `ctrlp.vim` -> `~/.config/nvim/ctrlp.vim`


### [vim-plug](https://github.com/junegunn/vim-plug)

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### More info

More documentation is present in the [vim directory](../../vim).

### Script

```bash
set -ex

# Install neovim
sudo apt install neovim curl git

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy the init.vim file
cp nvim/init.vim ~/.config/nvim/init.vim

# Copy the nerdtree.vim file
cp nvim/nerdtree.vim ~/.config/nvim/nerdtree.vim

# Copy the statusline.vim file
cp nvim/statusline.vim ~/.config/nvim/statusline.vim

# Copy the ctrlp.vim file
cp nvim/ctrlp.vim ~/.config/nvim/ctrlp.vim
```
