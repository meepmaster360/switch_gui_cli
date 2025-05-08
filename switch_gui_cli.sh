#!/bin/bash

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Use 'sudo ./switch_gui_cli.sh'."
    exit 1
fi

# Function to switch to GUI
enable_gui() {
    systemctl set-default graphical.target
    systemctl start lightdm
    echo "GUI mode enabled. Rebooting..."
    sleep 2
    reboot
}

# Function to switch to CLI
disable_gui() {
    systemctl set-default multi-user.target
    systemctl stop lightdm
    echo "CLI mode enabled. Rebooting..."
    sleep 2
    reboot
}

# Main menu
echo "Choose an option:"
echo "1) Enable GUI (Graphical Mode)"
echo "2) Disable GUI (Command Line Mode)"
echo "3) Exit"
read -p "Enter your choice (1/2/3): " choice

case $choice in
    1) enable_gui ;;
    2) disable_gui ;;
    3) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid choice. Exiting..."; exit 1 ;;
esac
