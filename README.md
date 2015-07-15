Jupyter Readme
==================

These handy scripts are to be used in a fresh directory (generally ~/jupyter).
***NOTE:*** it is probably better to just create links to these files in your
~/jupyter directory so that you always get the latest/greatest stuff. E.g.

    ~ $ mkdir jupyter && cd jupyter
    ~/jupyter $ ln -s ../projects/jupyter/* .
    ~/jupyter $ ./setup.sh
    ~/jupyter $ ./run.sh ../fun_dir_of_notebooks

System Notes
--------------

These are bash scripts and so far this has all only been tested on Debian 8
and Ubuntu 15.04.

The virtualenv is created for Python3 and includes system site packages.
That's because it can be a pain to get everything I want to use in a notebook
compiled, so on Ubuntu/Debian I generally use apt-get to install:


* matplotlib
* numpy
* scipy
* pandas
* seaborn
* atlas (scikit-learn prefers atlas over OpenBLAS)

You should also check out the
[scikit-learn install page](http://scikit-learn.org/dev/install.html)
for Ubuntu/Debian packages that should be installed. The latest scikit-learn
will be installed in the virtualenv per opt-reqs.txt.

If you use the "Download as PDF/LaTeX" options, you should also install the
pandoc package.

Files
-------

* setup.sh - Creates and populates a virtual environment, populates it with
  some init packages, optional stuff we need from opt-reqs.txt, nodeenv, and
  pre-installs npm packages that we need for jupyter in the nodeenv env. It
  also clones/pulls the latest jupyter code and builds it. Note that it can be
  multiple times - it will either build up from scratch or just update/refresh

* run.sh - uses the results of setup.sh to run Jupyter using the virtual
  Python/node.js env

* opt-reqs.txt - the requirements (other than some basic Python setup stuff and
  nodeenv) that we install in the virtualenv
