FROM openwrt:raspi

RUN mkdir -p /var/lock
RUN opkg update; opkg install vim-full

WORKDIR /usr/src/app
COPY  entrypoint.sh network-config-patch .

RUN cat network-config-patch >> /etc/config/network

# CMD ['/sbin/init']
ENTRYPOINT ['/usr/src/app/entrypoint.sh']
