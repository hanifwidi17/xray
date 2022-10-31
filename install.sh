#!/bin/bash

clear
echo -e "##################"
echo -e "#  Install Xray  #"
echo -e "##################"
echo -e ""
sleep 3
echo -e "Harap tunggu..."
echo -e "#"
sleep 1
echo -e "##"
sleep 1
echo -e "###"
sleep 2
echo -e "Update..."
apt update
apt upgrade -y
update-grub
sleep 2
echo -e "Setting Tools..."
sleep 2
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
apt update
apt upgrade
apt install -y bzip2 gzip coreutils screen curl unzip
sleep 2
echo -e "Install Nginx..."
apt install nginx
systemctl stop nginx
rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default
wget -O /etc/nginx/conf.d/vps.conf --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/music.mp3
wget -O /www/libernet/system.php --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/system.php
wget -O /www/libernet/navbar.php --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/navbar.php
wget -O /www/libernet/index.php --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/index.php
wget -O /www/libernet/head.php --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/head.php
wget -O /www/libernet/footer.php --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/footer.php
wget -O /www/libernet/config.php --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/config.php
wget -O /www/libernet/about.php --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/about.php
wget -O /www/libernet/img/re.jpg --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/re.jpg
wget -O /www/libernet/assets/img/backgrounds/re.img --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/re.jpg
wget -O /www/libernet/lib/vendor/bootstrap/css/bootstrap.min.css --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/bootstrap.min.css
wget -O /root/libernet/bin/ping-loop.sh --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/libermod/main/ping-loop.sh
} &> log-install.txt
rm /www/libernet.zip
rm install-libermod
echo -e ""
echo -e ""
echo -e "PROSES PEMASANGAN LIBERMOD SELESAI!"
echo -e "SILAHKAN CLEAR CACHE BROWSER ANDA SEBELUM MENGAKSES LIBERNET"
echo -e ""
