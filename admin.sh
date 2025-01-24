#!/usr/bin/env bash

#admin-helper
#v2.0.1
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
            ./menu/server_status.sh
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
