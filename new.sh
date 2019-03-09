#!/bin/bash

# Colors
NC='\033[0m';
RED='\033[0;31m';
GREEN='\033[0;32m';
BLUE='\033[0;34m';
ORANGE='\033[0;33m';

wget -q -O - https://archive.kali.org/archive-key.asc  | apt-key add
echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
apt-get update -m
apt-get install sublist3r unzip make gcc g++ wget git curl chromium-browser python-pip python3-pip p7zip-full -y;
echo -e "$GREEN""Installing Go from golang.org.""$NC";
wget https://dl.google.com/go/go1.12.linux-amd64.tar.gz;
sudo tar -C /usr/local -xzf go1.12.linux-amd64.tar.gz;
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:" >> "$HOME"/.profile;
source "$HOME"/.profile;
rm -rf go1.12.linux-amd64.tar.gz;
go get github.com/subfinder/subfinder;
go get github.com/gy741/subjack;
mkdir -pv ~/bounty/tools/aquatone;
wget https://github.com/michenriksen/aquatone/releases/download/v1.4.3/aquatone_linux_amd64_1.4.3.zip -O ~/bounty/tools/aquatone/aquatone.zip;
unzip ~/bounty/tools/aquatone/aquatone.zip -d ~/bounty/tools/aquatone; # Unzip aquatone
wget https://downloads.rclone.org/v1.46/rclone-v1.46-linux-amd64.zip -O ~/rclone.zip;
unzip ~/rclone.zip -d ~/;
mv ~/rclone-v1.46-linux-amd64 ~/rclone;
git clone https://github.com/rbsec/dnscan.git ~/bounty/tools/dnscan;
git clone https://github.com/infosec-au/altdns.git ~/bounty/tools/altdns; 
git clone https://github.com/blechschmidt/massdns.git ~/bounty/tools/massdns; 
cd ~/bounty/tools/massdns; make; # Compiling massdns, see repo for details
pip2 install -r ~/chomp-scan/requirements2.txt;
pip3 install -r ~/chomp-scan/requirements3.txt



echo -e "$GREEN""Please run 'source ~/.profile' to add the Go binary path to your \$PATH variable, then run Chomp Scan.""$NC";
echo -e "$ORANGE""Note: In order to use S3Scanner, you must configure your personal AWS credentials in the aws CLI tool.""$NC";
echo -e "$ORANGE""See https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html for details.""$NC";
