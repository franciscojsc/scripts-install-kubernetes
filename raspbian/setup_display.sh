#!/bin/sh


echo 
echo "**** Configure display 7 inch 					****"
echo "**** Adicionando opções de tela de 7 polegadas 	****"
echo 



#configTxt=/boot/config.txt
sudo cp /boot/config.txt /boot/config_backup.txt

echo "# Configure display 7 inch" | sudo tee -a /boot/config.txt
echo "max_usb_current=1" | sudo tee -a /boot/config.txt
echo "hdmi_group=2" | sudo tee -a /boot/config.txt
echo "hdmi_mode=1" | sudo tee -a /boot/config.txt
echo "hdmi_mode=87" | sudo tee -a /boot/config.txt
echo "hdmi_cvt 800 480 60 6 0 0 0" | sudo tee -a /boot/config.txt
echo "hdmi_drive=1" | sudo tee -a /boot/config.txt