#!/bin/sh

echo 
echo "**** updating system ****"
echo 


apt-get update && \
	 apt-get -y upgrade && \
	 apt-get update && \
	 apt-get -y autoremove && \
	 apt-get -y clean 



echo 
echo "**** disable swap ****"
echo 

swapoff -a
sudo systemctl disable dphys-swapfile.service

sudo dphys-swapfile swapoff && \
  sudo dphys-swapfile uninstall && \
  sudo update-rc.d dphys-swapfile remove

echo 
echo "**** enable cgroup ****"
echo 

echo Adding " cgroup_enable=cpuset cgroup_enable=memory" to /boot/cmdline.txt
cp /boot/cmdline.txt /boot/cmdline_backup.txt
echo "if you encounter problems, try changing cgroup_memory=1 to cgroup_enable=memory."
orig="$(head -n1 /boot/cmdline.txt) cgroup_enable=cpuset cgroup_memory=1"
echo $orig | sudo tee /boot/cmdline.txt
echo "gpu_mem=16" | sudo tee -a /boot/config.txt


echo 
echo "**** disable bluetooth ****"
echo 

echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
systemctl disable hciuart.service
systemctl disable bluealsa.service
systemctl disable bluetooth.service


echo 
echo "**** config network ****"
echo 

echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a  /etc/sysctl.conf
sysctl net.bridge.bridge-nf-call-iptables=1
sysctl net.ipv4.ip_forward=1


echo 
echo "**** Please restart raspberry ****"
echo "**** sudo reboot ****"
echo 
