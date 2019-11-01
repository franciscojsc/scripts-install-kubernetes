#!/bin/sh

echo 
echo "**** install repository packages kubernetes ****"
echo 

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

echo 
echo "**** update repository package ****"
echo 

sudo apt-get update -q

echo 
echo "**** install kubectl, kubeadm and kubelet ****"
echo 

sudo apt-get install -qy kubeadm
sudo apt-get install -qy kubectl
sudo apt-get install -qy kubelet

sudo apt-get update && \
sudo apt-get -y autoremove && \
sudo apt-get -y clean 
