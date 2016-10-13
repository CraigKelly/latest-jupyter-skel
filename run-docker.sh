#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SCRIPT_DIR/docker-vars.sh

echo "Insuring notebook dir $NBDIR"
mkdir -p $NBDIR

echo "Clearing previous docker container"
$SCRIPT_DIR/stop-docker.sh

# echo "Getting docker image: $DOCKER_IMG"
# sudo docker pull $DOCKER_IMG

echo "Starting $DOCKER_NAME"
sudo docker run --name $DOCKER_NAME -v $NBDIR:/home/jovyan/work -p 127.0.0.1:8888:8888 $DOCKER_IMG start-notebook.sh
