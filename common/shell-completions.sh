#!/bin/sh


echo 
echo "**** autocompletion kubectl ****"
echo 

# echo "source <(kubectl completion bash)" >> $HOME/.bashrc

# Shell Completions
kubeadm completion bash > /etc/bash_completion.d/kubeadm
kubectl completion bash > /etc/bash_completion.d/kubectl
