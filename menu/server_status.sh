#!/usr/bin/env bash

echo
echo "A report of what is happening on your server:"
echo
echo "Last login attempts:"
last -n 5
read -p "Press enter to continue"
echo
echo "journalctl:"
sudo journalctl -p 3 -xb
echo
read -p "Press enter to continue"
echo
echo "systemd:"
sudo systemctl --failed
echo
read -p "Press enter to continue"
echo
echo "connections:"
netstat -tulpn
echo
read -p "Press enter to continue"
echo
echo "fail2ban:"
sudo fail2ban-client status sshd
echo
read -p "Press enter to continue"
echo
echo "Update:"
sudo apt update
echo
read -p "Press enter to continue"
echo
