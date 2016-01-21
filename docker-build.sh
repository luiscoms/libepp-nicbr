#!/bin/bash

source docker-config.sh

# Delete all containers
# docker rm $(docker ps -aq)
docker rm ${DOCKER_NAME}

# Delete all untaged images
# docker rmi $(docker images --filter "dangling=true" -q | sort -u)

echo "Building docker image:"
docker build --force-rm -t ${DOCKER_TAG} .