#!/bin/bash
echo -e "\e[32m       ▄▄▄▄"
echo -e "\e[32m   ▄▄▀▀    ▀▀▄▄"
echo -e "\e[32m ▄▀            ▀▄"
echo -e "\e[32m █▀▄▄        ▄▄▀█ \e[37m █   █   ██   ▄█▀█▄ ▐█ ▄█▌ ▀█▀ █  █ █▀▀ ▐█▀▀▄   ▄██▄   █▄  ▄█"
echo -e "\e[32m █   ▀█▄▄▄▄█▀   █ \e[37m █▄▄▄█  █  █  █   ▀ ▐██▀    █  █▄▄█ █▄▄ ▐█▄▄█ ▐█▀  ▀█▌  ▀██▀"
echo -e "\e[32m █      ▐▌      █ \e[37m █▀▀▀█  ████  █   ▄ ▐██▄    █  █  █ █   ▐█▀▀█ ▐█▄  ▄█▌  ▄██▄"
echo -e "\e[32m ▀▄     ▐▌     ▄▀ \e[37m █   █ ▐█  █▌ ▀█▄█▀ ▐█ ▀█▌  █  █  █ █▄▄ ▐█▄▄▀   ▀██▀   █▀  ▀█"
echo -e "\e[32m   ▀▀▄▄ ▐▌ ▄▄▀▀"
echo -e "\e[32m       ▀▀▀▀"
echo " "
cat /etc/htb/banner_notice.txt | /usr/games/lolcat -S 55

if [ "$PS1" ]
then
    read -r -p "Press ENTER key to close. " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        exit
    fi
fi