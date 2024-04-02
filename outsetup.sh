#!/bin/bash

wget "https://raw.githubusercontent.com/radkesvat/ReverseTlsTunnel/master/scripts/install.sh" -O install.sh && chmod +x install.sh && bash install.sh

# Function to retrieve IP address of a domain
get_ip_address() {
    domain="$1"
    ip=$(dig +short "$domain")
    echo "$ip"
}

# Function to select which script to run
select_script() {
    echo "Which script do you want to run?"
    select script_port in "443" "8080" "8081" "5023" "Quit"; do
        case $script_port in
            "443" )
                ./RTT --kharej --iran-ip:$ip --iran-port:443 --toip:127.0.0.1 --toport:8487 --password:123 --sni:splus.ir
                ;;
            "8080" )
                ./RTT --kharej --iran-ip:$ip --iran-port:8080 --toip:127.0.0.1 --toport:8487 --password:123 --sni:splus.ir
                ;;
            "8081" )
                ./RTT --kharej --iran-ip:$ip --iran-port:8081 --toip:127.0.0.1 --toport:8487 --password:123 --sni:splus.ir
                ;;
            "5023" )
                ./RTT --kharej --iran-ip:$ip --iran-port:5023 --toip:127.0.0.1 --toport:8487 --password:123 --sni:splus.ir
                ;;
            "Quit" )
                echo "Exiting script."
                exit 0
                ;;
            * )
                echo "Invalid option. Please select again."
                ;;
        esac
    done
}

# Main script
domain="irip.rubeynews.de"
ip=$(get_ip_address "$domain")

if [ -z "$ip" ]; then
    echo "Failed to retrieve IP address for $domain"
    exit 1
fi

echo "IP address for $domain: $ip"
select_script
