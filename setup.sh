#!/bin/bash

# script for setting up a server using baseline configs and files


OS_TYPE='Linux'


TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'


# setup bash
if [OS_TYPE = 'Linux']; then
  sudo cp ./dotfiles/.bashrc ~/.bashrc
  sudo source ~/.bashrc
fi


# update package lists and install latest disto upgrades
sudo apt-get update
sudo apt-get dist-upgrade

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
sudo apt-get install fail2ban
sudo cp ./fail2ban/jail.local /etc/fail2ban/jail.local
sudo service fail2ban restart

echo -e $TEXT_YELLOW 
echo 'Fail2ban configured...'
echo -e $TEXT_RESET


# setup nginx
sudo apt-get install nginx

sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw enable

echo -e $TEXT_YELLOW 
echo 'NGINX installed and firewall configured...'
echo -e $TEXT_RESET

echo -e $TEXT_RED 
echo 'NGINX further configuration required...'
echo -e $TEXT_RESET


# TODO: setup docker
sudo apt-get install software-properties-common python-software-properties
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
echo -e $TEXT_YELLOW 
echo 'Docker-CE installed...'
echo -e $TEXT_RESET

# TODO: setup ghost-blog

# TODO: 
