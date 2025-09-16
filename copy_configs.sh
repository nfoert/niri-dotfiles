GREEN='\e[32m'
YELLOW='\e[33m'
RED='\e[31m'
GRAY='\e[90m'
PURPLE='\e[35m'
BOLD='\e[1m'
NC='\e[0m'

echo -e "\n    ${PURPLE}${BOLD}niri-dotfiles${NC} ${PURPLE}by nfoert${NC}"
echo -e "    ${GRAY}- https://github.com/nfoert/niri-dotfiles${NC}\n"

echo -e "${YELLOW}Press ${BOLD}enter${NC}${YELLOW} to copy all configuration files from this repository into their place on the system${NC}"
read
echo -e "${RED}Press ${BOLD}enter${NC}${RED} to confirm${NC}"
echo -e "${RED}${BOLD}This will irreversibly overwrite existing configuration files!${NC}"
read

echo -e "${GRAY}"

mkdir -p ~/.config/niri/scripts
mkdir -p ~/.config/waybar
mkdir -p ~/.config/fuzzel
mkdir -p ~/.config/nwg-bar
mkdir -p ~/.config/mako
mkdir -p ~/.config/kitty

cp ./niri/config.kdl ~/.config/niri/config.kdl
cp ./niri/scripts/* ~/.config/niri/scripts
cp ./waybar/config ~/.config/waybar/config
cp -r ./waybar/scripts ~/.config/waybar
cp ./waybar/style.css ~/.config/waybar/style.css
cp ./anyrun/config.ron ~/.config/anyrun/config.ron
cp ./anyrun/style.css ~/.config/anyrun/style.css
cp ./nwg-bar/bar.json ~/.config/nwg-bar/bar.json
cp ./nwg-bar/style.css ~/.config/nwg-bar/style.css
cp ./mako/config ~/.config/mako/config
cp ./zsh/.zshrc ~/.zshrc
cp ./zsh/.p10k.zsh ~/.p10k.zsh
cp ./kitty/kitty.conf ~/.config/kitty/kitty.conf

echo -e "${YELLOW}Do you want to copy wallpapers? (y/n)${NC}"
read copy_wallpapers
if [ "$copy_wallpapers" = "y" ]; then
    mkdir -p ~/Pictures/Wallpapers
    cp ./wallpapers/* ~/Pictures/Wallpapers
    echo -e "${GREEN}Wallpapers copied to ${GRAY}${HOME}/Pictures/Wallpapers${NC}"
fi

echo -e "${YELLOW}Do you want to apply a SDDM theme? (sugar-candy) (y/n)${NC}"
echo -e "${GRAY}This operation will require root permissions${NC}"
read copy_sddm
if [ "$copy_sddm" = "y" ]; then
    sudo cp ./sddm/sddm.conf /etc/sddm.conf
    mkdir -p /usr/share/sddm/themes
    sudo cp -r ./sddm/sugar-candy /usr/share/sddm/themes
    echo -e "${GREEN}SDDM theme copied to ${GRAY}/usr/share/sddm/themes${NC}"
fi

echo -e "${NC}"

echo -e "\n${GREEN}${BOLD}Done!${NC}"