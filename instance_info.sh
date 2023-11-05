#!/bin/bash

# Function to display the menu
show_menu() {
    clear
    echo "Instance Info 1.0"
    echo "1. RAM Info"
    echo "2. Hard-Disk Info"
    echo "3. Battery Info"
    echo "4. Processor Info"
    echo "5. About"
    echo "6. Exit"
}

# Function to display Ram info
show_ram_info() {
    free -h
    read -p "Press Enter to continue..."
}

# Function to display Hard-disk info
show_hard_disk_info() {
    df -h
    read -p "Press Enter to continue..."
}

# Function to display Battery info
show_battery_info() {
    if command -v upower &>/dev/null; then
        upower -i /org/freedesktop/UPower/devices/battery_BAT0
    else
        echo "upower is not installed. Install it to view battery info."
    fi
    read -p "Press Enter to continue..."
}

# Function to display Processor info
show_processor_info() {
    lscpu
    read -p "Press Enter to continue..."
}

# Function to display About
show_about() {
    echo "

By : Saman Wijseinghe 
Version : 1.0
License :  GNU GENERAL PUBLIC LICENSE

The "Instance Info" tool is a simple Bash script that provides an interactive way to access key system information on your computer. With a user-friendly menu, it allows you to effortlessly view details about your system's RAM, hard disk, battery (if available), and processor. Additionally, the tool offers an "About" option to provide a brief introduction to itself, making it a handy utility for quickly accessing essential system data.

"
    read -p "Press Enter to continue..."
}

while true; do
    show_menu
    read -p "Enter your choice: " choice

    case $choice in
        1) show_ram_info ;;
        2) show_hard_disk_info ;;
        3) show_battery_info ;;
        4) show_processor_info ;;
        5) show_about ;;
        6) exit ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
done
