#!/bin/bash

# Command 1
wget "https://raw.githubusercontent.com/radkesvat/ReverseTlsTunnel/master/scripts/install.sh" -O install.sh && chmod +x install.sh && bash install.sh

# Command 2
nohup ./RTT --iran --lport:443 --sni:splus.ir --password:123 &

# Command 3
nohup ./RTT --iran --lport:8080 --sni:splus.ir --password:123 &

# Command 4
nohup ./RTT --iran --lport:8081 --sni:splus.ir --password:123 &


nohup ./RTT --iran --lport:5053 --sni:splus.ir --password:123 &
