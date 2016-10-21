# To be sourced by our scripts



##########################################################################
# Set defaults for undefined variables that we use
if [ x"$DOCKER_NAME" == x ]; then
    export DOCKER_NAME=jupy-ds-nb-01
fi
if [ x"$DOCKER_IMG" == x ]; then
    export DOCKER_IMG=jupyter/datascience-notebook
fi
if [ x"$NBDIR" == x ]; then
    #export NBDIR="$HOME"
    export NBDIR=$(pwd)
fi
