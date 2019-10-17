[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/manishka/edfbrowser-docker)](https://hub.docker.com/r/manishka/edfbrowser-docker/builds)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/manishka/edfbrowser-docker)](https://hub.docker.com/r/manishka/edfbrowser-docker/builds)
[![Docker Pulls](https://img.shields.io/docker/pulls/manishka/edfbrowser-docker)](https://hub.docker.com/r/manishka/edfbrowser-docker)

# edfbrowser-docker

[EDFbrowser](https://www.teuniz.net/edfbrowser/index.html) in a Docker container.

## Requirements

* Docker 
* An X11 socket

## Quickstart

Assuming  that you are able to run `docker`
commands [without `sudo`](http://docs.docker.io/installation/ubuntulinux/#giving-non-root-access),
run below command from the directory (`$PWD`) which stores the EDF, EDF+, BDF or BDF+ files.

In the (dockerized) EDFbrowser, these datasets can be browsed from under `/data` directory.

```
docker run -ti --rm -e DISPLAY=$DISPLAY \
                    -v /tmp/.X11-unix:/tmp/.X11-unix \
                    -v $PWD:/data \
                    manishka/edfbrowser-docker:latest 
```

### macOS

* Install and run [XQuartz](https://www.xquartz.org/)

```
docker run -ti --rm -e DISPLAY=host.docker.internal:0 \
                    -v /tmp/.X11-unix:/tmp/.X11-unix \
                    -v $PWD:/data \
                    manishka/edfbrowser-docker:latest 
```

## Help! I started the container but I don't see the EDFbrowser screen

You might have an issue with the X11 socket permissions since the default user
used by the base image has an user and group ids set to `1000`, in that case
you can run either create your own base image with the appropriate ids or run below command on your machine and try again.
```
xhost +
``` 



