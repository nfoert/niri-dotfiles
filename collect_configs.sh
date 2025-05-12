GREEN='\e[32m'
CYAN='\e[36m'
GRAY='\e[90m'
PURPLE='\e[35m'
BOLD='\e[1m'
NC='\e[0m'

echo -e "\n    ${PURPLE}${BOLD}niri-dotfiles${NC} ${PURPLE}by nfoert${NC}"
echo -e "    ${GRAY}- https://github.com/nfoert/niri-dotfiles${NC}\n"

echo -e "${CYAN}Press ${BOLD}enter${NC}${CYAN} to collect all configuration files from the system into this repository${NC}"
read

echo -e "${GRAY}"
mkdir ./niri
mkdir ./niri/scripts
mkdir ./waybar
mkdir ./fuzzel
mkdir ./nwg-bar
mkdir ./mako
mkdir ./wallpapers

cp ~/.config/niri/config.kdl ./niri/config.kdl
cp ~/.config/niri/scripts/* ./niri/scripts
cp ~/.config/waybar/config ./waybar/config
cp ~/.config/waybar/style.css ./waybar/style.css
cp /etc/xdg/fuzzel/fuzzel.ini ./fuzzel/fuzzel.ini
cp ~/.config/nwg-bar/bar.json ./nwg-bar/bar.json
cp ~/.config/nwg-bar/style.css ./nwg-bar/style.css
cp ~/.config/mako/config ./mako/config
cp ~/Pictures/Wallpapers/* ./wallpapers
echo -e "${NC}"

echo -e "\n${GREEN}${BOLD}Done!${NC}"