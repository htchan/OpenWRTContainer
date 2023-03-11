FROM openwrt:raspi

# COPY network-config /etc/config/network
RUN mkdir -p /var/lock
RUN opkg update; opkg install vim-full
CMD ['/sbin/init']
