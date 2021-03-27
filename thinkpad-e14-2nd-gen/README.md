## Thinkpad E14 2nd Gen
This directory contains the settings/config files used in setting up the new Thinkpad E14 2nd Gen in March 2021.

Some of the configuration updates may require a reboot.

### Requirements
- [lxappearance](https://wiki.lxde.org/en/LXAppearance)

Installation Process:
```bash
sudo apt install lxappearance
```

- [Flameshot](https://github.com/flameshot-org/flameshot)

It is required for taking and editing screenshots. The Github release download [Link](https://github.com/flameshot-org/flameshot/releases/tag/v0.9.0) is here.

Installation Process:
```bash
sudo apt install ./flameshot-0.9.0-1.debian-10.amd64.deb
```

- [arandr](https://archlinux.org/packages/community/any/arandr/)

Installation Process:
```bash
sudo apt install arandr
```

- [i3status](https://i3wm.org/docs/i3status.html)

Installation Process:
```bash
sudo apt install i3status
```

- [i3lock](https://github.com/i3/i3lock)

Installation Process:
```bash
sudo apt install i3lock
```


- [dmenu](https://tools.suckless.org/dmenu/)

Installation Process:
```bash
sudo apt install dmenu
```


### Fonts

- [Cascadia](https://github.com/microsoft/cascadia-code/releases)

Download the zip and then unzip
```bash
$ unzip CascadiaCode-2102.25.zip
$ ls
total 8980
drwxr-xr-x 3 w w 4096 Feb 26 02:00 otf
drwxr-xr-x 3 w w 4096 Feb 26 02:00 ttf
drwxr-xr-x 3 w w 4096 Feb 26 02:03 woff2
-rw-r--r-- 1 w w 8666729 Mar 20 17:43 CascadiaCode-2102.25.zip
```

Copy the `ttf` font to `/usr/local/share/fonts`
```bash
$ pwd
/usr/local/share/fonts
$ ls
cascadia
$ tree
.
└── cascadia
    ├── CascadiaCodePL.ttf
    ├── CascadiaCode.ttf
    ├── CascadiaMonoPL.ttf
    └── CascadiaMono.ttf

```

Then run `fc-cache -f -v` to recreate the font cache and check if the installation was successful:
```bash
$ fc-list  | grep cascadia
/usr/local/share/fonts/cascadia/CascadiaCode.ttf: Cascadia Code:style=SemiBold
/usr/local/share/fonts/cascadia/CascadiaCodePL.ttf: Cascadia Code PL:style=Bold
```


### Icon Packs
[La Capitaine](https://github.com/keeferrourke/la-capitaine-icon-theme/).

Installation process:

```bash
cd ~/.icons
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
```
Open lxappearance and select the icon pack La Capitaine

![image](https://user-images.githubusercontent.com/4998915/111870446-d0797b00-89aa-11eb-8698-3eae2516edda.png)

### Theme

Open lxappearance and select the theme Matcha Dark Sea

![image](https://user-images.githubusercontent.com/4998915/111870471-f272fd80-89aa-11eb-8cc6-493c0b4ba816.png)


### Arandr Multi Screen setup and config

Open `arandr` by executing `arandr` from shell.

![image](https://user-images.githubusercontent.com/4998915/111871257-f7d24700-89ae-11eb-845c-edc54517ab1c.png)

Configure based on the current scenario and save the config using `Layout` > `Save As`.
Open the `i3` config and add the content of the `arandr` config, like,
```bash

-----

exec_always xrandr --output VGA-0 --off --output LVDS --mode 1366x768 --pos 0x1080 --rotate normal --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal

-----

```

This is what my basic setup looks like:

![image](https://user-images.githubusercontent.com/4998915/112724912-8446b180-8f3b-11eb-9cbb-7c1fa33f505e.png)


