# docker-udpxy
Yet another multiarch udpxy Dockerfile.

The Dockerfile included in this repo:
* builds the HEAD UDPxy from https://github.com/pcherenkov/udpxy.
* copies the binary to a minimal alpine linux image (e.g.: [arm32v7/alpine](https://hub.docker.com/r/arm32v7/alpine), depending on the arch).
* published it on Docker Hub as [sbzr/udpxy](https://hub.docker.com/repository/docker/sbzr/udpxy).

It uses `buildx` to build containers for `amd64`, `arm/v7` and `arm/v8`.

It uses Github Actions to build this for every commit / daily.
