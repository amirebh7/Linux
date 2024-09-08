#!/bin/bash

# Function to set default DNS
set_default_dns() {
    echo -e "nameserver 10.202.10.202\nnameserver 10.202.10.101" | sudo tee /etc/resolv.conf > /dev/null
    echo "Default DNS has been set:"
    cat /etc/resolv.conf
}

# Function to set custom DNS
set_custom_dns() {
    read -p "Enter the first DNS: " dns1
    read -p "Enter the second DNS (optional, press enter to skip): " dns2
    
    # Check if the second DNS is provided
    if [ -z "$dns2" ]; then
        echo -e "nameserver $dns1" | sudo tee /etc/resolv.conf > /dev/null
    else
        echo -e "nameserver $dns1\nnameserver $dns2" | sudo tee /etc/resolv.conf > /dev/null
    fi
    
    echo "Custom DNS has been set:"
    cat /etc/resolv.conf
}

# Main script starts here
echo "Choose an option:"
echo "1) Set default DNS"
echo "2) Set custom DNS"
read -p "Enter your choice (1 or 2): " choice

if [ "$choice" -eq 1 ]; then
    set_default_dns
elif [ "$choice" -eq 2 ]; then
    set_custom_dns
else
    echo "Invalid choice. Please run the script again and select either 1 or 2."
fi

