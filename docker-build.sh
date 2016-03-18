#!/bin/bash

source docker-config.sh

# Delete all containers
# docker rm $(docker ps -aq)
docker rm ${DOCKER_NAME} 2>/dev/null

# Delete all untaged images
# docker rmi $(docker images --filter "dangling=true" -q | sort -u)

echo "Building docker image:"
docker build --force-rm \
	-t ${DOCKER_REPO}/${DOCKER_NAME}:${DOCKER_TAG} \
	-f 1.15/Dockerfile_c7 \
	1.15/
	# -t ${DOCKER_NAME}:latest \
	# -t ${DOCKER_REPO}/${DOCKER_NAME}:latest \
	# -t ${DOCKER_NAME}:${DOCKER_TAG} \