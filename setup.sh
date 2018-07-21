#!/bin/bash

# script for setting up a server using baseline configs and files


TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'


# setup bash
sudo cp ./dotfiles/.bashrc ~/.bashrc
source ~/.bashrc

echo -e $TEXT_YELLOW 
echo 'Bash and dotfiles copied...'
echo -e $TEXT_RESET


# update package lists and install latest disto upgrades
sudo apt-get update
sudo apt-get dist-upgrade -y

echo -e $TEXT_YELLOW 
echo 'APT update and distribution upgrade finished...'
echo -e $TEXT_RESET


# setup basic firewall
sudo ufw default deny
sudo ufw allow 'OpenSSH'
sudo ufw enable -y

echo -e $TEXT_YELLOW 
echo 'Firewall configured...'
echo -e $TEXT_RESET


# setup fail2ban
sudo apt-get install fail2ban -y
sudo cp ./fail2ban/jail.local /etc/fail2ban/jail.local
sudo service fail2ban reload
sudo service fail2ban restart

echo -e $TEXT_YELLOW 
echo 'Fail2ban configured...'
echo -e $TEXT_RESET


# setup nginx
sudo apt-get install nginx -y

sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw enable -y

echo -e $TEXT_YELLOW 
echo 'NGINX installed and firewall configured...'
echo -e $TEXT_RESET

echo -e $TEXT_RED_B
echo 'NGINX further configuration required...'
echo -e $TEXT_RESET


# setup docker
sudo apt-get install software-properties-common python-software-properties
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
echo -e $TEXT_YELLOW 
echo 'Docker-CE installed...'
echo -e $TEXT_RESET

# TODO: setup ghost-blog

# cleanup files after configuration complete
sudo rm -r ../server_config
sudo apt-get autoremove -y
sudo apt-get clean

# confirm script complete
echo -e $TEXT_YELLOW 
echo 'Script complete'
echo -e $TEXT_RESET

echo -e $TEXT_RED_B
echo 'Some packages require further configuration'
echo -e $TEXT_RESET
