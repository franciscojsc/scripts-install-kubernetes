#!/bin/sh

echo "██████╗  █████╗ ███████╗██████╗ ██████╗ ██╗ █████╗ ███╗   ██╗";
echo "██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔══██╗████╗  ██║";
echo "██████╔╝███████║███████╗██████╔╝██████╔╝██║███████║██╔██╗ ██║";
echo "██╔══██╗██╔══██║╚════██║██╔═══╝ ██╔══██╗██║██╔══██║██║╚██╗██║";
echo "██║  ██║██║  ██║███████║██║     ██████╔╝██║██║  ██║██║ ╚████║";
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝";
echo "                                                             ";
echo "       ██╗    ██╗██╗████████╗██╗  ██╗                        ";
echo "       ██║    ██║██║╚══██╔══╝██║  ██║                        ";
echo "       ██║ █╗ ██║██║   ██║   ███████║                        ";
echo "       ██║███╗██║██║   ██║   ██╔══██║                        ";
echo "       ╚███╔███╔╝██║   ██║   ██║  ██║                        ";
echo "        ╚══╝╚══╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝                        ";
echo "                                                             ";
echo "       ██╗  ██╗ █████╗ ███████╗                              ";
echo "       ██║ ██╔╝██╔══██╗██╔════╝                              ";
echo "       █████╔╝ ╚█████╔╝███████╗                              ";
echo "       ██╔═██╗ ██╔══██╗╚════██║                              ";
echo "       ██║  ██╗╚█████╔╝███████║                              ";
echo "       ╚═╝  ╚═╝ ╚════╝ ╚══════╝                              ";
echo "                                                             ";
echo  "__        __         _               _   _           _       "
echo  "\ \      / /__  _ __| | _____ _ __  | \ | | ___   __| | ___  "
echo  " \ \ /\ / / _ \| '__| |/ / _ \ '__| |  \| |/ _ \ / _\` |/ _ \ "
echo  "  \ V  V / (_) | |  |   <  __/ |    | |\  | (_) | (_| |  __/ "
echo  "   \_/\_/ \___/|_|  |_|\_\___|_|    |_| \_|\___/ \__,_|\___| "


read -p " $(date +%H:%M:%S) Press CRTL+C to abort... " -t 5

echo  
echo "**** Config raspberry pi 3 to work node master with k8s, Docker and Helm *****"
echo   

./install_prerequisites.sh

../common/shell-completions.sh



echo "███████╗██╗███╗   ██╗██╗███████╗██╗  ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ";
echo "██╔════╝██║████╗  ██║██║██╔════╝██║  ██║    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ";
echo "█████╗  ██║██╔██╗ ██║██║███████╗███████║    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ";
echo "██╔══╝  ██║██║╚██╗██║██║╚════██║██╔══██║    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ";
echo "██║     ██║██║ ╚████║██║███████║██║  ██║    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗";
echo "╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝";
echo "                                                                                                  ";

echo "Do you know the parameters (ip:port, token and cert-hash) for joining the cluster?[yes/no]: "
read answer
if [ -z $answer -o $answer != 'yes' ]
then
	echo  
	echo "**** The next step is to join with the master node.                     *****"
	echo "**** Execute [kubeadm token create --print-join-command] to get the key *****"
	echo "**** and then join the cluster                                          *****"
	echo 
else
    echo "Server IP:"
	read IP
	echo "Token:"
	read token
	echo "Hash:"
	read hash

kubeadm join $IP --token $token \
    	--discovery-token-ca-cert-hash $hash

fi
