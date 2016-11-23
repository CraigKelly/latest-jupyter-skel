# Jupyter README

This repository contains scripts to make it easier to run the latest Jupyter
docker image. See the branch `archived-native-notebook` for the "legacy"
scripts if you still want to try and run the latest Jupyter code natively.

To get started and make sure you have the latest Docker image provided by the
[docker-stacks](https://github.com/jupyter/docker-stacks) repo, use:

```
$ ~/latest-jupyter-skel/update-jupyter
```

To run the Docker image listening on 127.0.0.1:8888 using the current
directory as the notebook "home", use:

```
$ ~/latest-jupyter-skel/run-jupyter
```

You may specify a different directory for the notebook home with the
environment variable `NBDIR`. For example:

```
$ NBDIR=/opt/my-notebooks ~/latest-jupyter-skel/run-jupyter
```

or in a script:

```
#!/bin/bash
export NBDIR=/opt/my-notebooks
~/latest-jupyter-skel/run-jupyter
```

To stop and delete the Docker image, use

```
$ ~/latest-jupyter-skel/stop-jupyter
```

The local Docker image name, the Docker source, and the default value for
NBDIR are all controlled in `docker-vars.sh`.
