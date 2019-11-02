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
echo  " __  __           _              _   _           _       "
echo  "|  \/  | __ _ ___| |_ ___ _ __  | \ | | ___   __| | ___  "
echo  "| |\/| |/ _\` / __| __/ _ \ '__| |  \| |/ _ \ / _\` |/ _ \ "
echo  "| |  | | (_| \__ \ ||  __/ |    | |\  | (_) | (_| |  __/ "
echo  "|_|  |_|\__,_|___/\__\___|_|    |_| \_|\___/ \__,_|\___| "

read -p " $(date +%H:%M:%S) Press CRTL+C to abort... " -t 5

echo  
echo "**** Config raspberry pi 3 to work node master with k8s, Docker and Helm *****"
echo   

# echo 
# echo "**** install prerequisites ****"
# echo 

./install_prerequisites.sh

echo 
echo "**** init cluster ****"
echo 

kubeadm config images pull -v3

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$(hostname -i)


mkdir -p $HOME/.kube 
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown  $(id -u):$(id -g)  $HOME/.kube/config

echo 
echo "**** pod network - flannel ****"
echo 

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

echo 
echo "**** view status cluster ****"
echo

kubectl get nodes,svc,deploy,rs,rc,po -o wide


echo 
echo "**** enable apps in master ****"
echo

kubectl taint nodes --all node-role.kubernetes.io/master-

../common/shell-completions.sh

# echo 
# echo "**** install hello world ****"
# echo 

./install_hello_world.sh

# echo 
# echo "**** install helm ****"
# echo 

./install_helm.sh



echo "███████╗██╗███╗   ██╗██╗███████╗██╗  ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ";
echo "██╔════╝██║████╗  ██║██║██╔════╝██║  ██║    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ";
echo "█████╗  ██║██╔██╗ ██║██║███████╗███████║    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ";
echo "██╔══╝  ██║██║╚██╗██║██║╚════██║██╔══██║    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ";
echo "██║     ██║██║ ╚████║██║███████║██║  ██║    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗";
echo "╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝";
echo "                                                                                                  ";



echo 
echo "**** add node worker with token ****"
echo 

kubeadm token create --print-join-command
