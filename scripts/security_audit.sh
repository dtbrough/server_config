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

echo -e $TEXT_YELLOW
echo 'Unique Ban List Count (Total)'
echo -e $TEXT_RESET
grep "Ban " /var/log/fail2ban.log | awk -F[\ \:] '{print $10,$8}' | sort | uniq -c | sort -n
echo -e $TEXT_YELLOW
echo 'Unique Ban List Count (by IP)'
echo -e $TEXT_RESET
awk '($(NF-1) = /Ban/){print $NF}' /var/log/fail2ban.log | sort | uniq -c | sort -n
echo -e $TEXT_YELLOW
echo 'Unique Ban List Count (by Subnet)'
echo -e $TEXT_RESET
zgrep -h "Ban " /var/log/fail2ban.log* | awk '{print $NF}' | awk -F\. '{print $1"."$2"."}' | sort | uniq -c  | sor$
echo 'substitute subnet into the following to get history and IP'
echo 'zgrep -c 210.213. /var/log/fail2ban.log*'
echo "zcat /var/log/fail2ban.log* | awk '(NF == 6 && $NF ~ /^210\.213\./){print $NF}' | sort | uniq -c"

# confirms the script has completed
echo -e $TEXT_YELLOW
echo 'End of security report'
echo -e $TEXT_RESET
