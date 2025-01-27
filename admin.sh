#!/usr/bin/env bash

#admin-helper
#v2.2.0
#by mattrattus
#https://mattrattus.github.io

GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

echo
echo -e "${GREEN}Hi $USER!${RESET}"
echo
echo -e "${YELLOW}Today is: $(date)${RESET}"
echo

show_menu() {
    echo -e "${GREEN}===== ADMIN HELPER MENU =====${RESET}"
    echo -e "${BLUE}0. System update${RESET}"
    echo -e "${BLUE}1. Server status${RESET}"
    echo -e "${BLUE}2. Tool_1 - apache2_virtualhost${RESET}"
    echo -e "${BLUE}3. Tool_2 - var_www_permissions${RESET}"
    echo -e "${BLUE}4. Exit${RESET}"
    echo -e "${GREEN}=============================${RESET}"
}

while true; do
    show_menu
    read -p "Choose the option: " choice

    if ! [[ $choice =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Please enter a valid number.${RESET}"
        continue
    fi

    case $choice in
        0)
            sudo apt update && sudo apt -y upgrade
            ;;
        1)
            ./menu/server_status.sh
            ;;
        2)
            ./menu/tools/apache2_virtualhost.sh
            ;;
        3)
            ./menu/tools/var_www_permissions.sh
            ;;
        4)
            echo
            echo -e "${GREEN}Have a nice day $USER!${RESET}"
            echo
            exit 0
            ;;
        *)
            echo -e "${RED}Incorrect selection. Try again.${RESET}"
            ;;
    esac
done
