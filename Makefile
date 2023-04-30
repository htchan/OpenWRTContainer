import-raspi:
	docker import https://archive.openwrt.org/releases/22.03.2/targets/armvirt/64/openwrt-22.03.2-armvirt-64-default-rootfs.tar.gz openwrt:raspi

setup-network:
	sudo ip link set eth0 promisc on

setup-docker-container-network:
	docker network create -d macvlan --subnet=192.168.0.0/24 --gateway=192.168.0.1 -o parent=eth0 openwrt-network

run:
	docker run --name openwrt_1 -d --network openwrt-network --privileged openwrt-executable:raspi /sbin/init

build:
	docker build -t openwrt-executable:raspi .

stop-clean:
	docker kill openwrt_1 ; docker container prune -f

