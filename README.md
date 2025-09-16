# niri-dotfiles


<div align="center">

  ![alt text](repo/images/screenshot.png)

  **My dotfiles for [niri](https://github.com/YaLTeR/niri).**

</div>

## Installation
> [!NOTE]
> These scripts place config files into the correct places for Arch Linux. I expect the locations to be similar if not the same on other distros, but some adjustments of the copy and collection scripts might be necessary

First, Install all the [required packages](#required-packages). Then, run the following shell script to install the config files to their correct place
```bash
sh copy_configs.sh
```

You will be asked if you also want to copy the wallpapers and SDDM theme to your system

If you make changes to the config files and want to back them up inside this repository, run this command:
```bash
sh collect_configs.sh
```

## Included Scripts
Several scripts are included in this repo
- `suspend` - Automatically suspends, sleeps, and locks the device after a certain amount of time
- `rotate-wallpaper` - Switches to a new random wallpaper on all monitors every 30 minutes
- `rotate-wallpaper-once` - Switches to a new random wallpaper when `Super+S` is pressed
- `battery` - Watches the battery level, and if it gets too low the screen will dim and eventually the system will hibernate

## Keybinds
A few custom keybinds are added to provide some utility
- **Super+S** - Switches to a new random wallpaper
- **Super+M** - Toggles the auto suspend mode (For when you want to temporarily prevent auto suspend)
- **Super+P** - Cycles between power profiles using `powerprofilesctl`

## Required Packages
These packages can be automatically installed for some distros using the following:
```bash
sh install_dependecies.sh
```

- `niri`
- `anyrun`
- `mako`
- `swww`
- `nwg-bar`
- `waybar`
- `swaylock-effects`
- `xwayland-satellite`
- `kitty`
- `power-profiles-daemon`
- `sddm`
  - `qt5‑graphicaleffects`
  - `qt5‑quickcontrols2`
  - `qt5‑svg`
- `ttf-0xproto-nerd`
- `zsh`
  - [`oh-my-zsh`](https://github.com/ohmyzsh/ohmyzsh#basic-installation)
  - [`powerline10k`](https://github.com/romkatv/powerlevel10k#oh-my-zsh)

## To-Do
- [x] Make `xwayland-satellite` start on compositor start
- [x] Make a customized terminal
- [x] Add a script for warning when the battery is running low (and also lowers brightness) and automatically hibernates when it's at critical levels
- [x] Describe how to get waybar fonts and icons working

## Credits
All wallpapers are from various users on [Wallhaven](https://wallhaven.cc)