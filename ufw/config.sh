#!/bin/bash

sudo ufw default deny
sudo ufw allow ssh
sudo ufw allow nginx
sudo ufw enable
