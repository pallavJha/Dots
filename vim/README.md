<h3 align="center">✨ For all things Vim ✨</h3>

> Note: Changes being made in this README are already there in the .vimrc file. No need to make it again.

#### [VIM-Pathogen](https://github.com/tpope/vim-pathogen)

Commands to setup `Pathogen`:

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Then add this to the `.vimrc`:

```vim
execute pathogen#infect()
```

#### [NERDTree](https://github.com/preservim/nerdtree)

The installation of NERDTree was not done using pathogen. It was done manually.

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



#### [coc.nvim](https://github.com/neoclide/coc.nvim#quick-start)

This plugin is NodeJS extension host for vim.

##### Installation Steps

```bash
cd ~/.vim/bundle
git clone https://github.com/neoclide/coc.nvim.git
```

That's all. If VIM Pathogen is installed tand configured in the `.vimrc` then it would be picked up.
`.vimrc` already contains the necessay configuraion required to use it, however, a language server needs to be installed:

In side Normal mode type:
```vim
:CocInstall coc-json coc-tsserver
```

for installing the TS server. More [info](https://github.com/neoclide/coc.nvim#quick-start).

##### Shortcuts to remember
- gd: For navigating to the function defintion
- gy: For navigating to the type defintion
- gi: For navigating to the implementation
- gr: For navigation to the references
-  K: To get the documemntation

##### Screenshots
- Code Completetion (Ctrl + Space)

![image](https://user-images.githubusercontent.com/4998915/113676477-5404be80-9671-11eb-9843-5285819ccbd3.png)

- Function References (gd)

![image](https://user-images.githubusercontent.com/4998915/113676598-7f87a900-9671-11eb-9614-6402537c914c.png)


- Function Definition (K)

![image](https://user-images.githubusercontent.com/4998915/113676707-a1812b80-9671-11eb-8af4-6768a5da5dfc.png)






#### [CtrlP](https://github.com/kien/ctrlp.vim)

File finder

##### Installation Steps


```bash
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim
```

That's all. If VIM Pathogen is installed tand configured in the `.vimrc` then it would be picked up. To configure the shortcuts
add this in the `.vimrc`:

```vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
```

##### Screenshots

![image](https://user-images.githubusercontent.com/4998915/113676997-ee650200-9671-11eb-9739-7458f7157fba.png)



#### Themes

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

