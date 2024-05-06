#!/bin/bash
###############
# auteur : brahim haouchine
#script pour créer un network docker et lancer 2 containers sur ce network
#
# requirements: docker and user added to sudo of docker
###############


#créer un réseau docker "eznet" en (bridge) @réseau : 192.168.2.0/24
docker network create --driver=bridge --subnet=192.168.2.0/24 eznet

#créer 2 containers docker de ubuntu dans le réseau eznet
for n in 1 2 
do
docker run -ti --name ubuntu-$n --network eznet -d ubuntu bash
echo "ubuntu-$n créé"
done
