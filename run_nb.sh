#!/bin/bash

# Find script dir WITHOUT following symlinks so that we use the directory that
# the user indicated by running the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Use our virtual environment and run the application in DEBUG mode
source $SCRIPT_DIR/env/bin/activate
jupyter notebook $*
