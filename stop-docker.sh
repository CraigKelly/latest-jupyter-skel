#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SCRIPT_DIR/docker-vars.sh

echo "Stopping $DOCKER_NAME"
sudo docker stop $DOCKER_NAME

echo "Killing $DOCKER_NAME"
sudo docker rm $DOCKER_NAME
