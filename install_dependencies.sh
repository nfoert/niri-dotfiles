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
SUPPORTED=false

if [ "$DISTRO" = "arch" ]; then
    SUPPORTED=true
    echo -e "${GRAY}"

    sudo pacman -Sy --needed niri mako swww nwg-bar waybar xwayland-satellite kitty power-profiles-daemon sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg ttf-0xproto-nerd zsh

    echo -e "${NC}"

    echo -e "${YELLOW}${BOLD}swaylock-effects${NC}${YELLOW} and ${NC}${YELLOW}${BOLD}anyrun${NC}${YELLOW} will need to be installed from the AUR using something like ${GRAY}yay -S swaylock-effects anyrun${NC}"
    echo -e "    ${GRAY}- https://aur.archlinux.org/packages/swaylock-effects${NC}"
else
    echo -e "${RED}You're using an unsupported distro. Please open an issue or PR to expand this installer!${NC}"
fi

if [ "$SUPPORTED" = "true" ]; then
    echo -e "${NC}"

    echo -e "${YELLOW}Do you want to setup zsh as your default shell and install all plugins? (y/n)${NC}"
    echo -e "${GRAY}This operation will require root permissions${NC}"
    read install_zsh
    if [ "$install_zsh" = "y" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        sudo chsh -s $(which zsh)
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
        git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

        echo -e "${GREEN}Zsh and plugins installed!${NC}"
        echo -e "${GRAY}Restart your terminal for changes to take effect${NC}"
    fi
fi

echo -e "\n${GREEN}${BOLD}Done!${NC}"
