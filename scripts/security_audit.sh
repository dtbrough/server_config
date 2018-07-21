#!/bin/bash

# runs various commands and outputs results to terminal to check for any undesired bahaviour

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

echo -e $TEXT_YELLOW
echo 'Current logins'
echo -e $TEXT_RESET

sudo w

echo -e $TEXT_YELLOW
echo 'Last logins'
echo -e $TEXT_RESET

sudo last

echo -e $TEXT_YELLOW
echo 'Current ufw status'
echo -e $TEXT_RESET

sudo ufw status

echo -e $TEXT_YELLOW
echo 'Current connections'
echo -e $TEXT_RESET

sudo netstat -plunt

echo -e $TEXT_YELLOW
echo 'Current running processes'
echo -e $TEXT_RESET

sudo ps -auxf

echo -e $TEXT_YELLOW
echo 'fail2ban status'
echo -e $TEXT_RESET

sudo fail2ban-client status sshd
echo -e

sudo fail2ban-client status nginx-http-auth
echo -e

sudo fail2ban-client status nginx-badbots
echo -e

sudo fail2ban-client status nginx-noproxy
echo -e

sudo fail2ban-client status recidive

echo -e $TEXT_YELLOW
echo 'End of security report'
echo -e $TEXT_RESET
