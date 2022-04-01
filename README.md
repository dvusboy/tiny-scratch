This Docker image that this repository produces is basically a [scratch image](https://hub.docker.com/_/scratch)
with a statically-linked `/usr/bin/true`. The purpose is to support data-volume containers, which now is out-of-favor.

The Docker image is available from the Hub: https://hub.docker.com/repository/docker/dvusboy/tiny-scratch
