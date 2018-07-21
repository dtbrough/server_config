#!/bin/bash

# runs various commands and outputs results to terminal to check for any undesired bahaviour

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

# displays the current logged in users
echo -e $TEXT_YELLOW
echo 'Current logins'
echo -e $TEXT_RESET

sudo w

# displays the login history
echo -e $TEXT_YELLOW
echo 'Last logins'
echo -e $TEXT_RESET

sudo last

# displays the ufw status
echo -e $TEXT_YELLOW
echo 'Current ufw status'
echo -e $TEXT_RESET

sudo ufw status

# displays the current active connections and LISTEN / ESTABLISHED status
echo -e $TEXT_YELLOW
echo 'Current connections'
echo -e $TEXT_RESET

sudo netstat -plunt

# displays the currently running processes (with tree view)
echo -e $TEXT_YELLOW
echo 'Current running processes'
echo -e $TEXT_RESET

sudo ps -auxf

# displays the status of all fail2ban jails and banned count
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

# confirms the script has completed
echo -e $TEXT_YELLOW
echo 'End of security report'
echo -e $TEXT_RESET
