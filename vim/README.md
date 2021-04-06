<h3 align="center">✨ For all things Vim ✨</h3>

#### NERDTree

##### Installation Steps
```bash
mkdir -p ~/.vim/
cd /tmp/
curl -L -o nerdTree.6.10.9.zip https://github.com/preservim/nerdtree/archive/refs/tags/6.10.9.zip
unzip nerdTree.6.10.9.zip
mv nerdtree-6.10.9/* ~/.vim/
```
##### Shortcuts to remember
- Press **o** to open the file in a new buffer or open/close directory.
- Press **t** to open the file in a new tab.
- Press **i** to open the file in a new horizontal split.
- Press **s** to open the file in a new vertical split.
- Press **p** to go to parent directory.
- Press **r** to refresh the current directory.


##### Snapshots
- NERDTree Setup
![image](https://user-images.githubusercontent.com/4998915/113415153-3cf96e80-93dc-11eb-8e8e-486255b6bdb5.png)


#### Monokai Theme

The themes are present in the `colors` directory:
```bash
~/code/dots/vim $ tree
.
├── colors
│   ├── monokai.vim
│   └── solarized.vim
└── README.md

1 directory, 3 files
```

To set the theme in vim, for example, `monokai`, update the following config params in `.vimrc`

```vim
" Colorscheme
colorscheme monokai 
syntax enable
set background=dark
```

- Monokai theme has been taken from [here](https://github.com/mom0tomo/dotfiles/blob/master/vim/.vim/colors/monokai.vim). I got the reference to it from [here](https://vimcolors.com/642/monokai/dark).


- Solarized theme has been taken from [here](https://github.com/altercation/vim-colors-solarized/blob/master/colors/solarized.vim).

##### Theme screenshot
![image](https://user-images.githubusercontent.com/4998915/113415172-48e53080-93dc-11eb-9a6a-e4771faa1c73.png)

