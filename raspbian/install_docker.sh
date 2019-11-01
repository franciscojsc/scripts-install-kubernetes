#!/bin/sh


echo 
echo "**** install docker ****"
echo 


apt-get update && \
	 apt-get -y upgrade && \
	 apt-get update && \
	 apt-get -y autoremove && \
	 apt-get -y clean 


apt-get install apt-transport-https ca-certificates software-properties-common -y 
	curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
	sudo usermod -aG docker pi
	sudo curl https://download.docker.com/linux/raspbian/gpg
	echo "deb https://download.docker.com/linux/raspbian/ stretch stable" | tee -a /etc/apt/sources.list
	
apt-get update && \
	 apt-get -y upgrade && \
	 apt-get update && \
	 apt-get -y autoremove && \
	 apt-get -y clean 

systemctl start docker.service
sudo systemctl enable docker

echo 
echo "**** config deamon cgroup ****"
echo 

echo '{"exec-opts": ["native.cgroupdriver=systemd"],"log-driver": "json-file","log-opts": {"max-size": "100m"},"storage-driver": "overlay2"}' > /etc/docker/daemon.json

mkdir -p /etc/systemd/system/docker.service.d

systemctl daemon-reload
systemctl restart docker


echo 
echo "**** Install docker compose ****"
echo 

apt-get install docker-compose -y