#!/bin/bash
###############
# auteur : brahim haouchine
###############

#création du back end du registry

docker run -d -p 5000:5000 -e REGISTRY_STORAGE_DELETE_ENABLED=true -e REGISTRY_HTTP_HEADERS_Access-Control-Allow-Methods=[HEAD,GET,OPTIONS,DELETE] -e  REGISTRY_HTTP_HEADERS_Access-Control-Credentials=[true] -e REGISTRY_HTTP_HEADERS_Access-Control-Allow-Headers=[Authorization,Accept,Cache-Control] -e REGISTRY_HTTP_HEADERS_Access-Control-Expose-Headers=[Docker-Content-Digest] --net eazy --name registry-eazy registry:2

#création du front end du registry
docker run -d -p 8090:80 -e NGINX_PROXY_PASS_URL=http://registry-eazy:5000 --net eazy -e DELETE_IMAGES=true -e REGISTRY_TITLE=Reg-training --name frontend-eazy joxit/docker-registry-ui:2
