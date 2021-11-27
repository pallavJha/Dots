<h2 align="center">
<img height="25 width="25" src="https://user-images.githubusercontent.com/4998915/113819343-069a5700-972e-11eb-8120-b41c308da95b.png"/>
<br/>
<a href="/vim">For all things Vim</a>
</h2>

> Note: Changes being made in this README are already there in the .vimrc file. No need to make it again.

### Table of Contents:
- [VIM Pathogen](#vim-pathogen)
- [NERDTree](#nerdtree)
- [natebosch/vim-lsc](#nateboschvim-lsc)
- [CtrlP](#ctrlp)
- [Themes](#themes)
  - [Favorite Themes](#favorite-themes)
- [Statusline Configuration](#statusline-configuration)
- [Shortcuts to remember](#shortcuts-to-remember)              
              
### [VIM-Pathogen](https://github.com/tpope/vim-pathogen)

Manages VIM plugins.

#### Installation Steps
Commands to setup `Pathogen`:

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Then add this to the `.vimrc`:

```vim
execute pathogen#infect()
```

### [NERDTree](https://github.com/preservim/nerdtree)

The installation of NERDTree was not done using pathogen. It was done manually.

#### Installation Steps
##### Without Pathogen
```bash
mkdir -p ~/.vim/
cd /tmp/
curl -L -o nerdTree.6.10.9.zip https://github.com/preservim/nerdtree/archive/refs/tags/6.10.9.zip
unzip nerdTree.6.10.9.zip
mv nerdtree-6.10.9/* ~/.vim/
```
##### With Pathogen
```bash
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
```           
              
#### Snapshots
- NERDTree Setup
![image](https://user-images.githubusercontent.com/4998915/131223075-3d882521-7360-4acd-b2dd-ac29e20e253a.png)


### [natebosch/vim-lsc](https://github.com/natebosch/vim-lsc)

This plugin is NodeJS extension host for vim.

#### Installation Steps

```bash
cd ~/.vim/bundle
git clone https://github.com/natebosch/vim-lsc
```

That's all. If VIM Pathogen is installed and configured in the `.vimrc` then it would be picked up.
`.vimrc` already contains the necessay configuraion required to use it, however, a language server needs to be installed:

#### Configuring LSP for Go
- Install gopls
```bash
$ GO111MODULE=on go get golang.org/x/tools/gopls@latest
```
- Update `.vimrc` to use `gopls` for Go files
```vim
let g:lsc_server_commands = {'go': 'gopls'}
```

- Update `.vimrc` to configure `vim-lsc`
```vim
" Complete default mappings are:
let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': 'g<C-n>',
    \ 'PreviousReference': 'g<C-p>',
    \ 'FindImplementations': 'gi',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}              
```
#### Shortcuts
- gd: For navigating to the function defintion
- gi: For navigating to the implementation
- gr: For navigation to the references
-  K: To get the documemntation

#### Screenshots
- Code Completetion

![image](https://user-images.githubusercontent.com/4998915/131223267-97028741-d13f-454a-a17b-39f1a5542be2.png)

- Function References (gr)
![image](https://user-images.githubusercontent.com/4998915/131223281-a787c0a0-8619-441c-b0ca-50c34ef61b7f.png)

- Function Definition (K)

![image](https://user-images.githubusercontent.com/4998915/131223297-787e8277-4674-4976-b2a4-657d8b16291e.png)

### [CtrlP](https://github.com/kien/ctrlp.vim)

File finder

#### Installation Steps

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

#### Screenshots

![image](https://user-images.githubusercontent.com/4998915/113676997-ee650200-9671-11eb-9739-7458f7157fba.png)

### Themes

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

### Favorite Themes

|#|Name|Source|Reference|
|-|----|------|---------|
|1|Monokai|[→](https://github.com/mom0tomo/dotfiles/blob/master/vim/.vim/colors/monokai.vim)|[→](https://vimcolors.com/642/monokai/dark)|
|2|Solarized|[→](https://github.com/altercation/vim-colors-solarized/blob/master/colors/solarized.vim)| |
|3|Apprentice|[→](https://github.com/romainl/Apprentice)|[→](https://github.com/romainl/vim-rnb)|
|4|Vim Monokai - Based on Sublime|[→](https://github.com/crusoexia/vim-monokai)||
|5|Photon|[→](https://github.com/axvr/photon.vim)||
|6|Edge|[→](https://github.com/sainnhe/edge)||  
|7|Sonokai|[→](https://github.com/sainnhe/sonokai)||  
 

#### Theme screenshot
![image](https://user-images.githubusercontent.com/4998915/113415172-48e53080-93dc-11eb-9a6a-e4771faa1c73.png)

### Statusline Configuration
Screenshot:

![image](https://user-images.githubusercontent.com/4998915/126040385-5a028020-1c97-41fd-b106-64bce14ae5a6.png)
  
### Shortcuts to Remember
- <kbd>:term</kbd> For terminal
- <kbd>C-\\</kbd> then <kbd>C-n</kbd> For normal mode in terminal, <kbd>i</kbd> to go back to Terminal mode
- <kbd>C-w</kbd> then <kbd>H, J, K, L</kbd> to move the current split
- <kbd>:vsp</kbd> for vertical split
- <kbd>g</kbd> then <kbd>T</kbd> or <kbd>t</kbd> for tab navigation
- <kbd>m</kbd> on an entry in NERDTree list to get the options for actions

#### :NERDTree shortcuts
- Press **o** to open the file in a new buffer or open/close directory.
- Press **t** to open the file in a new tab.
- Press **i** to open the file in a new horizontal split.
- Press **s** to open the file in a new vertical split.
- Press **p** to go to parent directory.
- Press **r** to refresh the current directory.

