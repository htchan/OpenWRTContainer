#!/bin/ash

sleep 10 && sed -i '/^config interface \x27lan\x27/,/^$/d' /etc/config/network && cat network-config-patch >> /etc/config/network && cat /etc/config/network &

/sbin/init
