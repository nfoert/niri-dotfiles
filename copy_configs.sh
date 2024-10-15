echo Press enter to copy all configuration files from this repo to their place on the system
read

cp ./niri/config.kdl ~/.config/niri/config.kdl
cp ./waybar/config ~/.config/waybar/config
cp ./waybar/style.css ~/.config/waybar/style.css
cp ./fuzzel/fuzzel.ini /etc/xdg/fuzzel/fuzzel.ini
cp ./nwg-bar/bar.json ~/.config/nwg-bar/bar.json
cp ./nwg-bar/style.css ~/.config/nwg-bar/style.css

echo Copied configuration files