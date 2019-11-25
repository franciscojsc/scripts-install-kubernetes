#!/bin/sh

echo 
echo "**** install helm ****"
echo 


curl -LO https://git.io/get_helm.sh | bash
sudo chmod +x get_helm.sh
bash ./get_helm.sh

echo 
echo "**** config permissions ****"
echo 

cat <<EOF > helm-config.yml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: tiller
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: tiller
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: tiller
    namespace: kube-system
EOF

kubectl apply -f helm-config.yml

echo 
echo "**** init helm ****"
echo 

helm init --tiller-image=jessestuart/tiller
