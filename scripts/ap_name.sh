#!/bin/sh
if [ $(whoami) != 'root' ]; then
    echo "Script failure: EXECUTE AS ROOT!";
    exit
fi

# Random value...
SSIDRANDOM=`tr -dc A-Z0-9 </dev/urandom | head -c 5`
SSID="CyberCrisisGame-$SSIDRANDOM"

#Overwrite the ssid=... value in /etc/hostapd/hostapd.conf
sed -i "s/^ssid=.*/${SSID}/" /etc/hostapd/hostapd.conf

#Restart service...
sudo systemctl restart hostapd