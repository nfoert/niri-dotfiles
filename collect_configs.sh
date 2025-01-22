echo Press enter to collect all configuration files from the system
read

mkdir ./niri
mkdir ./niri/scripts
mkdir ./waybar
mkdir ./fuzzel
mkdir ./nwg-bar
mkdir ./mako

cp ~/.config/niri/config.kdl ./niri/config.kdl
cp ~/.config/niri/scripts/* ./niri/scripts
cp ~/.config/waybar/config ./waybar/config
cp ~/.config/waybar/style.css ./waybar/style.css
cp /etc/xdg/fuzzel/fuzzel.ini ./fuzzel/fuzzel.ini
cp ~/.config/nwg-bar/bar.json ./nwg-bar/bar.json
cp ~/.config/nwg-bar/style.css ./nwg-bar/style.css
cp ~/.config/mako/config ./mako/config

echo Collected all configuration files from the system and copied them to the repo