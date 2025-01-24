#!/usr/bin/env bash

GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

echo
echo -e "${GREEN}A report of what is happening on your server:${RESET}"
echo
echo -e "${BLUE}Last login attempts:${RESET}"
last -n 5
read -p "Press enter to continue"
echo
echo -e "${BLUE}journalctl:${RESET}"
sudo journalctl -p 3 -xb
echo
read -p "Press enter to continue"
echo
echo -e "${BLUE}systemd:${RESET}"
sudo systemctl --failed
echo
read -p "Press enter to continue"
echo
echo -e "${BLUE}connections:${RESET}"
netstat -tulpn
echo
read -p "Press enter to continue"
echo
echo -e "${BLUE}fail2ban:${RESET}"
sudo fail2ban-client status sshd
echo
read -p "Press enter to continue"
echo
echo -e "${BLUE}Update:${RESET}"
sudo apt update
echo
read -p "Press enter to continue"
echo
