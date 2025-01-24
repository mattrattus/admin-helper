#!/usr/bin/env bash

#admin-helper
#v2.0.0
#by mattrattus
#https://mattrattus.github.io

echo
echo "Hi $USER!"
echo
echo "Today is: $(date)"
echo

show_menu() {
    echo -e "\033[32m===== ADMIN HELPER MENU =====\033[0m"
    echo "1. Server status"
    echo "2. Exit"
    echo -e "\033[32m=============================\033[0m"
}

while true; do
    show_menu
    read -p "Choose the option: " choice

    if ! [[ $choice =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    continue
    fi

    case $choice in
        1)
            echo
            echo -e "\033[36m<<<<<===== Please confirm your password: =====>>>>>\033[0m"
            sudo echo
            echo "A report of what is happening on your server::"
            echo
            echo -e "\033[36m<<<<<===== Last login attempts =====>>>>>\033[0m"
            last -n 5
            read -p "Press enter to continue"
            echo
            echo -e "\033[36m<<<<<===== journalctl =====>>>>>\033[0m"
            sudo journalctl -p 3 -xb
            echo
            read -p "Press enter to continue"
            echo
            echo -e "\033[36m<<<<<===== systemd =====>>>>>\033[0m"
            sudo systemctl --failed
            echo
            read -p "Press enter to continue"
            echo
            echo -e "\033[36m<<<<<===== connections =====>>>>>\033[0m"
            netstat -tulpn
            echo
            read -p "Press enter to continue"
            echo
            echo -e "\033[36m<<<<<===== fail2ban =====>>>>>\033[0m"
            sudo fail2ban-client status sshd
            echo
            read -p "Press enter to continue"
            echo
            echo -e "\033[36m<<<<<===== Update =====>>>>>\033[0m"
            sudo apt update
            echo
            read -p "Press enter to continue"
            echo
            ;;
        2)
            echo
            echo "Have a nice day $USER!"
            echo
            exit 0
            ;;
        *)
            echo "Incorrect selection. Try again."
            ;;
    esac
done