#!/usr/bin/env bash

# Kolory
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

# Funkcja sprawdzająca, czy katalog istnieje
check_directory() {
    if [ ! -d "/var/www/$1" ]; then
        echo -e "${RED}Error: Directory /var/www/$1 does not exist.${RESET}"
        echo
        return 1
    fi
    return 0
}

# Główna część skryptu
echo -e "${BLUE}Please enter the directory name (without the full path):${RESET}"
read directory_name
echo

# Sprawdzanie, czy katalog istnieje z pełną ścieżką
if ! check_directory "$directory_name"; then
    exit 1
fi

# Wykonywanie poleceń
echo -e "${YELLOW}Changing ownership of the directory and its contents...${RESET}"
sudo chown -R www-data:www-data "/var/www/$directory_name"

echo -e "${YELLOW}Setting directory permissions...${RESET}"
sudo find "/var/www/$directory_name" -type d -exec chmod 755 {} \;

echo -e "${YELLOW}Setting file permissions...${RESET}"
sudo find "/var/www/$directory_name" -type f -exec chmod 644 {} \;

# Komunikat zakończenia
echo
echo -e "${GREEN}Done!${RESET}"
echo
read -p "Press enter to continue"
