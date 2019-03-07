#!/bin/bash

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
echo '# Kali linux repositories | Added by Katoolin\ndeb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
sudo apt-get update -m
sudo apt install unzip curl sublist3r masscan nmap nikto gobuster chromium-browser python-pip python3-pip p7zip-full  whatweb wafw00f -y;
echo -e "$GREEN""Installing Go from golang.org.""$NC";
wget https://dl.google.com/go/go1.12.linux-amd64.tar.gz;
sudo tar -C /usr/local -xzf go1.12.linux-amd64.tar.gz;
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:" >> "$HOME"/.profile;
source "$HOME"/.profile;
rm -rf go1.12.linux-amd64.tar.gz;
go get github.com/subfinder/subfinder;
go get github.com/haccer/subjack;
go get github.com/ffuf/ffuf;
mkdir -pv ~/bounty/tools/aquatone;
wget https://github.com/michenriksen/aquatone/releases/download/v1.4.3/aquatone_linux_amd64_1.4.3.zip -O ~/bounty/tools/aquatone/aquatone.zip;
uzip ~/bounty/tools/aquatone/aquatone.zip -d ~/bounty/tools/aquatone; # Unzip aquatone
git clone https://github.com/rbsec/dnscan.git ~/bounty/tools/dnscan;
git clone https://github.com/infosec-au/altdns.git ~/bounty/tools/altdns; 
git clone https://github.com/blechschmidt/massdns.git ~/bounty/tools/massdns; 
cd ~/bounty/tools/massdns; make; # Compiling massdns, see repo for details
git clone https://github.com/mazen160/bfac.git ~/bounty/tools/bfac;