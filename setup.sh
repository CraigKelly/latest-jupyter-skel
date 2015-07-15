#!/bin/bash

set -e

##########################################################################
# Configuration variables

NODEENV_VER=env-0.12.7-prebuilt


##########################################################################
# Make sure we're in our script directory
# NOTE: we find script dir WITHOUT following symlinks so that we use the
# directory that the user indicated by running the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR


##########################################################################
# Emphasis function

function emph() {
    echo -e "\033[33m$1\033[0m"
}


##########################################################################
# Startup message

emph "You need Python2, Python3, and a recent virtualenv installed"
emph "nodeenv will be used to install a node.js in the virtualenv"
echo ""
emph "Using system site packages - you should probably have already installed"
emph "matplotlib, numpy, scipy, pandas, seaborn, and openblas or atlas for the"
emph "system"
echo ""


##########################################################################
# Setup the virtualenv along with the nodeenv - if they're already setup
# we just update the base needed packages.
# REGARDLESS we activate our virtualenv

function ve_activate_and_update() {
    source $SCRIPT_DIR/env/bin/activate
    pip install --upgrade setuptools pip wheel
    pip install --upgrade -r opt-reqs.txt
    pip install --upgrade nodeenv
}

if [ -d env ];
then
    emph "Virtual environment env already exists - will only check for upgrades"
    ve_activate_and_update
    npm update -g bower gulp configurable-http-proxy
else
    emph "Creating virtual environment env with python 3, system site packages, and node.js"
    virtualenv --system-site-packages -p python3 env
    ve_activate_and_update
    nodeenv -p --prebuilt $NODEENV_VER
    npm install -g bower gulp configurable-http-proxy
fi


##########################################################################
# Build the latest jupyter

if [ -d notebook ];
then
    emph "notebook exists - just pulling latest"
    pushd notebook
    git pull --all
    popd
else
    emph "notebook repo not found - cloning"
    git clone https://github.com/jupyter/notebook.git
fi

pushd notebook
emph "Installing requirements and jupyter notebook"
pip install --upgrade -r requirements.txt
./setup.py install
popd


##########################################################################
# Jupyter sometimes requires files that might not already exist. If we
# know how, go ahead and create them

function need_file() {
    dn=$(dirname $1)
    if [ ! -d $dn ];
    then
        emph "Creating directory $dn"
        mkdir -p "$dn"
    fi
    if [ ! -f $1 ];
    then
        emph "Touching file $1"
        touch "$1"
    fi
}

need_file "$HOME/.ipython/profile_default/static/custom/custom.js"
need_file "$HOME/.ipython/profile_default/static/custom/custom.css"
