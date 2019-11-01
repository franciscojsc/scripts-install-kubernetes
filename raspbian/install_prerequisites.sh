#!/bin/sh

echo 
echo "**** update repository package ****"
echo 

apt-get update && \
	 apt-get -y upgrade && \
	 apt-get update && \
	 apt-get -y autoremove && \
	 apt-get -y clean 

# echo 
# echo "**** install docker ****"
# echo 

./install_docker.sh

# echo 
# echo "**** install repository packages kubernetes ****"
# echo 

./install_k8s.sh

