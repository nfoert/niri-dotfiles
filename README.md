# niri-dotfiles


<div align="center">

  ![alt text](repo/images/screenshot.png)

  **My dotfiles for [niri](https://github.com/YaLTeR/niri).**

</div>

## Installation
> [!NOTE]
> These scripts place config files into the correct places for Open SUSE Tumbleweed. I expect the locations to be similar if not the same on other distros, but some adjustments of the copy and collection scripts might be necessary

First, Install all of the [required packages](#required-packages). Then, run the following shell script to install of the config files to their correct place
```bash
sh copy_configs.sh
```

You will be asked if you also want to copy the wallpapers to your system

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

## Required Packages
- `niri`
- `fuzzel`
- `mako`
- `swww`
- `nwg-bar`
- `waybar`
- `swaylock`
- `xwayland-satellite`

## To-Do
- [x] Make `xwayland-satellite` start on compositor start
- [ ] Make a customized terminal
- [x] Add a script for warning when the battery is running low (and also lowers brightness) and automatically hibernates when it's at critical levels

## Credits
All wallpapers are from various users on [Wallhaven](https://wallhaven.cc)