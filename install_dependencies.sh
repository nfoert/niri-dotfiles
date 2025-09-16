GREEN='\e[32m'
CYAN='\e[36m'
YELLOW='\e[33m'
RED='\e[31m'
GRAY='\e[90m'
PURPLE='\e[35m'
BOLD='\e[1m'
NC='\e[0m'

echo -e "\n    ${PURPLE}${BOLD}niri-dotfiles${NC} ${PURPLE}by nfoert${NC}"
echo -e "    ${GRAY}- https://github.com/nfoert/niri-dotfiles${NC}\n"

echo -e "${YELLOW}Press ${BOLD}enter${NC}${YELLOW} to install all dependencies for these dotfiles${NC}"
echo -e "${CYAN}This currently supports ${BOLD}${CYAN}Arch Linux${NC}"
read

DISTRO=$(awk -F= '/^ID/{print $2}' /etc/os-release)

if [ "$DISTRO" = "arch" ]; then
    echo -e "${GRAY}"

    sudo pacman -Sy --needed niri fuzzel mako swww nwg-bar waybar xwayland-satellite kitty power-profiles-daemon sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg ttf-0xproto-nerd zsh

    echo -e "${NC}"

    echo -e "${YELLOW}${BOLD}swaylock-effects${NC}${YELLOW} and ${NC}${YELLOW}${BOLD}anyrun${NC}${YELLOW} will need to be installed from the AUR using something like ${GRAY}yay -S swaylock-effects anyrun${NC}"
    echo -e "    ${GRAY}- https://aur.archlinux.org/packages/swaylock-effects${NC}"
else
    echo -e "${RED}You're using an unsupported distro. Please open an issue or PR to expand this installer!${NC}"
fi

echo -e "\n${GREEN}${BOLD}Done!${NC}"
