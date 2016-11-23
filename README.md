# Jupyter README

# IMPORTANT

You are looking at an archival branch that included code and hacks to install
and run the latest Jupyter notebook natively. I haven't used this technique in
a loooong time, and I no longer know if it even works. You should be using the
Docker technique in the master branch.

## Running with Docker

Probably the easiest and fastest way is to use the Jupyter docker images
provided by [docker-stacks](https://github.com/jupyter/docker-stacks). By
default, `run-docker.sh` will run the docker image named "jupy-ds-nb-01" and
mount the directory `$HOME/jupyter`. You can change this with environment
variables. For instance, run a Jupyter notebook server for notebooks stored in
`/opt/my_notebooks` you could run: `NBDIR=/opt/my_notebooks ./run-docker.sh`.
Script details:

* `dockers-vars.sh` - defines default values for environment variables in case
  you don't specify any.
* `run-docker.sh` - run to start a docker container.
* `stop-docker.sh` - run to stop and delete the docker container.

## Running the latest Jupyter natively

The scripts `setup.sh`, `run_nb.sh`, and `run_nbconvert.sh` are for running
the latest code from the public jupyter GitHub repository.

We wrote these scripts for use in a fresh directory (generally ~/jupyter). We
recommend creating links to these files in your ~/jupyter directory so that
you always get the latest and greatest. For example:

````
~ $ mkdir jupyter && cd jupyter
~/jupyter $ ln -s ../latest-jupyter-skel/* .
~/jupyter $ ./setup.sh
~/jupyter $ ./run.sh ../fun_dir_of_notebooks
````

The virtualenv and notebook repo directories are in .gitignore, so you can
clone to a directory and run from there if you like.

## System Notes

These are bash scripts tested on:

* Debian 8
* Ubuntu 15.04
* Ubuntu 15.10
* Ubuntu 16.04

The virtualenv uses Python 3 and includes system site packages. That's because
it can be a pain to get everything I want to use in a notebook compiled, so on
Ubuntu/Debian I generally use apt-get to install:

* matplotlib
* numpy
* scipy
* pandas
* seaborn
* atlas (scikit-learn prefers atlas over OpenBLAS)

You should also check out the
[scikit-learn install page](http://scikit-learn.org/dev/install.html)
for Ubuntu/Debian dependencies. The `setup.sh` script installs the latest
scikit-learn into the virtualenv via opt-reqs.txt.

If you use the "Download as PDF/LaTeX" options, you should also install the
pandoc package.

## Files

* setup.sh - Creates and populates a virtual environment, populates it with
  some init packages, optional packages we need from opt-reqs.txt, nodeenv, and
  installs npm packages that we need for jupyter in the nodeenv env. It also
  clones/pulls the latest jupyter code and builds it. Note that you may run it
  more than once - it will either build up from scratch or update/refresh

* run.sh - uses the results of setup.sh to run Jupyter using the virtual
  Python/node.js env

* opt-reqs.txt - the requirements (other than basic Python packages and
  nodeenv) that we install in the virtualenv
