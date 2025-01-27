#!/usr/bin/env bash

# Kolory
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

# Prośba o hasło sudo
echo -e "${BLUE}Please enter your sudo password:${RESET}"
sudo -v

# Prośba o dane
echo -e "${BLUE}Enter the domain name (e.g. domain.com):${RESET}"
read domain_name

echo -e "${BLUE}Enter the email address (e.g. adres@domain.com):${RESET}"
read email_address

echo -e "${BLUE}Enter the directory name (without full path, e.g. domain_com):${RESET}"
read directory_name

# Ścieżka do pliku konfiguracyjnego - z nazwą domeny w formacie domena_com.conf
config_file="/etc/apache2/sites-available/${domain_name//./_}.conf"

# Tworzenie zawartości pliku
echo
echo -e "${YELLOW}Creating the configuration file for $domain_name...${RESET}"
echo

echo "<VirtualHost *:80>" | sudo tee "$config_file" > /dev/null
echo "    ServerName $domain_name" | sudo tee -a "$config_file" > /dev/null
echo "    ServerAlias www.$domain_name" | sudo tee -a "$config_file" > /dev/null
echo "    ServerAdmin $email_address" | sudo tee -a "$config_file" > /dev/null
echo "    DocumentRoot /var/www/$directory_name" | sudo tee -a "$config_file" > /dev/null
echo "    ErrorLog \${APACHE_LOG_DIR}/error.log" | sudo tee -a "$config_file" > /dev/null
echo "    CustomLog \${APACHE_LOG_DIR}/access.log combined" | sudo tee -a "$config_file" > /dev/null
echo "</VirtualHost>" | sudo tee -a "$config_file" > /dev/null

# Zakończenie
echo -e "${GREEN}Configuration file for $domain_name created successfully!${RESET}"
read -p "Press enter to continue"
