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
timedatectl set-timezone Asia/Jakarta
sleep 2
echo -e "Install Nginx..."
sleep 2
apt install nginx
systemctl stop nginx
rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default
wget -O /etc/nginx/conf.d/vps.conf --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/vps.conf
wget -O /etc/nginx/conf.d/xray.conf --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/xray.conf
sleed 2
echo -e "Import Cert"
sleep 2
mkdir /etc/xray
wget -O /etc/xray/xray.key --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/xray.key
wget -O /etc/xray/xray.crt --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/xray.crt
sleep 2
echo -e "Install Xray"
sleep 2
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
rm /etc/systemd/system/xray@.service.d/10-donot_touch_single_conf.conf
cat >/etc/systemd/system/xray@.service.d/10-donot_touch_single_conf.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/local/bin/xray run -config /etc/xray/%i.json
EOF
wget -O /usr/bin/add-trojan --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/add-trojan
wget -O /usr/bin/add-ws --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/add-ws
wget -O /usr/bin/exp-trial --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/exp-trial
wget -O /usr/bin/exp-akun --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/exp-akun
wget -O /usr/bin/renew-trojan --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/renew-trojan
wget -O /usr/bin/renew-ws --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/renew-ws
wget -O /usr/bin/trial-trojan --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/trial-trojan
wget -O /usr/bin/trial-ws --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/trial-ws
wget -O /etc/xray/trojan.json --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/trojan.json
wget -O /etc/xray/trojan-grpc.json --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/trojan-grpc.json
wget -O /etc/xray/vmess.json --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/vmess.json
wget -O /etc/xray/vmess-grpc.json --no-check-certificate https://raw.githubusercontent.com/hanifwidi17/xray/main/vmess-grpc.json
chmod +x /usr/bin/add-trojan
chmod +x /usr/bin/add-ws
chmod +x /usr/bin/trial-trojan
chmod +x /usr/bin/trial-ws
chmod +x /usr/bin/renew-trojan
chmod +x /usr/bin/renew-ws
chmod +x /usr/bin/exp-trial
chmod +x /usr/bin/exp-akun
systemctl enable xray@trojan
systemctl enable xray@trojan-grpc
systemctl enable xray@vmess
systemctl enable xray@vmess-grpc
systemctl restart nginx
sleep 2
echo -e "Install Speedtest"
sleep 2
apt-get install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
apt-get install speedtest
sleep 2
echo -e "Installasi Sukses, reboot..."
sleep 2
rm install.sh
reboot
