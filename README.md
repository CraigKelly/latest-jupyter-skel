# Jupyter Readme

We wrote these scripts for use in a fresh directory (generally ~/jupyter). We
recommend creating links to these files in your ~/jupyter directory so that
you always get the latest/greatest stuff. E.g.

````
~ $ mkdir jupyter && cd jupyter
~/jupyter $ ln -s ../latest-jupyter-skel/* .
~/jupyter $ ./setup.sh
~/jupyter $ ./run.sh ../fun_dir_of_notebooks
````

The virtualenv and notebook repo dirs are in .gitignore, so you can just clone
to a directory and run from there if you like.

## System Notes

These are bash scripts tested on:

* Debian 8
* Ubuntu 15.04
* Ubuntu 15.10
* Ubuntu 16.04

The virtualenv is created for Python3 and includes system site packages.
That's because it can be a pain to get everything I want to use in a notebook
compiled, so on Ubuntu/Debian I generally use apt-get to install:

* matplotlib
* numpy
* scipy
* pandas
* seaborn
* atlas (scikit-learn prefers atlas over OpenBLAS)

You should also check out the [scikit-learn install page](http://scikit-
learn.org/dev/install.html) for Ubuntu/Debian dependencies. The `setup.sh`
script installs the latest scikit-learn into the virtualenv via opt-reqs.txt.

If you use the "Download as PDF/LaTeX" options, you should also install the
pandoc package.

## Files

* setup.sh - Creates and populates a virtual environment, populates it with
  some init packages, optional stuff we need from opt-reqs.txt, nodeenv, and
  pre-installs npm packages that we need for jupyter in the nodeenv env. It
  also clones/pulls the latest jupyter code and builds it. Note that you may
  run it more than once - it will either build up from scratch or just
  update/refresh


* run.sh - uses the results of setup.sh to run Jupyter using the virtual
  Python/node.js env

* opt-reqs.txt - the requirements (other than some basic Python setup stuff and
  nodeenv) that we install in the virtualenv
