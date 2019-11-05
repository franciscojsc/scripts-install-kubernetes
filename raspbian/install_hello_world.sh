#!/bin/sh

echo 
echo "**** Install arm32v7/busybox with 1 replicas ****"
echo

kubectl run --generator=run-pod/v1 busybox1 --image=arm32v7/busybox -- sleep 3600

echo 
echo "**** Install hello world with 3 replicas ****"
echo

kubectl create -f hello_world.yml 

read -p " $(date +%H:%M:%S) Waiting for 15 sec before execute test... " -t 15

echo
echo "**** Running the test at http://127.0.0.1:31118...  ****"
echo "****    - Input: curl -4 http://127.0.0.1:31118 -d \"# test\" ****"
echo "****    - Verify that the output is: <p><h1>test</h1> </p>  ****"
echo
echo
echo
curl -4 http://127.0.0.1:31118 -d "# test"
echo
echo
echo
read -p " $(date +%H:%M:%S) See result... " -t 15