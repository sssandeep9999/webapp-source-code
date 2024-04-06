#!/bin/bash
VERSION=$(date +%H-%M-%S)
docker build -t satyasandeep901/testingbuild:${VERSION} .
docker push satyasandeep901/testingbuild:${VERSION}
docker -H tcp://10.1.1.200:2375 stop nginx
docker -H tcp://10.1.1.200:2375 run --rm -dit -p 8000:80 --name nginx --hostname nginx satyasandeep901/testingbuild:${VERSION}
echo "---------------------"
