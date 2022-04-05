#!/bin/sh
if [ $(whoami) != 'root' ]; then
    echo "Script failure: EXECUTE AS ROOT!";
    exit
fi

# Random value...
SSIDRANDOM=`tr -dc A-Z0-9 </dev/urandom | head -c 5`
SSID="CyberCrisisGame-$SSIDRANDOM"

PASSWORD=`tr -dc a-zA-Z0-9 </dev/urandom | head -c 8`

#Let the console know the new credentals...
echo "SSID is $SSID with password $PASSWORD..."

#Overwrite the ssid=... & wpa_passphrase value in /etc/hostapd/hostapd.conf
sed -i "s/^ssid=.*/ssid=${SSID}/" /etc/hostapd/hostapd.conf
sed -i "s/^wpa_passphrase=.*/wpa_passphrase=${PASSWORD}/" /etc/hostapd/hostapd.conf

#Restart service...
sudo systemctl restart hostapd

