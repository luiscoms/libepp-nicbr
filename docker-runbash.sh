#!/bin/bash

source docker-config.sh

docker run --name ${DOCKER_NAME} --rm -it -v $(dirname "$(readlink -f "$0")")/:/libepp-nicbr ${DOCKER_TAG} bash
