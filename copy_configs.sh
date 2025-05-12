GREEN='\e[32m'
YELLOW='\e[33m'
GRAY='\e[90m'
PURPLE='\e[35m'
BOLD='\e[1m'
NC='\e[0m'

echo -e "\n    ${PURPLE}${BOLD}niri-dotfiles${NC} ${PURPLE}by nfoert${NC}"
echo -e "    ${GRAY}- https://github.com/nfoert/niri-dotfiles${NC}\n"

echo -e "${YELLOW}Press ${BOLD}enter${NC}${YELLOW} to copy all configuration files from this repository into their place on the system${NC}"
read

echo -e "${GRAY}"
cp ./niri/config.kdl ~/.config/niri/config.kdl
cp ./niri/scripts/* ~/.config/niri/scripts
cp ./waybar/config ~/.config/waybar/config
cp ./waybar/style.css ~/.config/waybar/style.css
cp ./fuzzel/fuzzel.ini /etc/xdg/fuzzel/fuzzel.ini
cp ./nwg-bar/bar.json ~/.config/nwg-bar/bar.json
cp ./nwg-bar/style.css ~/.config/nwg-bar/style.css
cp ./mako/config ~/.config/mako/config

echo -e "${YELLOW}Do you want to copy wallpapers? (y/n)${NC}"
read copy_wallpapers
if [ "$copy_wallpapers" = "y" ]; then
    cp ./wallpapers/* ~/Pictures/Wallpapers
    echo -e "${GREEN}Wallpapers copied to ${GRAY}${HOME}/Pictures/Wallpapers${NC}"
fi

echo -e "${NC}"

echo -e "\n${GREEN}${BOLD}Done!${NC}"