#!/bin/bash

chown nginx:nginx /var/session -Rf
chown nginx:nginx /var/www -Rf
chown nginx:nginx /var/www/config -Rf
chown nginx:nginx /var/www/backups -Rf
chmod 750 /var/www -Rf
#chown nginx:nginx /var/session -Rf

echo "Permissions set!"
