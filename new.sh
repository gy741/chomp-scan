#!/bin/bash

# Colors
NC='\033[0m';
RED='\033[0;31m';
GREEN='\033[0;32m';
BLUE='\033[0;34m';
ORANGE='\033[0;33m';

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
echo '# Kali linux repositories | Added by Katoolin\ndeb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
sudo apt-get update -m

sudo apt-get install unzip git gcc g++ wget curl nmap masscan nikto whatweb wafw00f chromium-browser python-pip python3-pip p7zip-full -y;
echo -e "$GREEN""Installing Go from golang.org.""$NC";
wget https://dl.google.com/go/go1.12.linux-amd64.tar.gz;
sudo tar -C /usr/local -xzf go1.12.linux-amd64.tar.gz;
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:" >> "$HOME"/.profile;
source "$HOME"/.profile;
rm -rf go1.12.linux-amd64.tar.gz;



echo -e "$GREEN""Please run 'source ~/.profile' to add the Go binary path to your \$PATH variable, then run Chomp Scan.""$NC";
echo -e "$ORANGE""Note: In order to use S3Scanner, you must configure your personal AWS credentials in the aws CLI tool.""$NC";
echo -e "$ORANGE""See https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html for details.""$NC";
