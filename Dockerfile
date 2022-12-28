ARG ARCH=

FROM ${ARCH}alpine:latest as builder

LABEL maintainer="1673590+5Ub-Z3r0@users.noreply.github.com"

RUN apk update && apk add make gcc git libc-dev openssh-client

WORKDIR /tmp
RUN git clone https://github.com/arebert20/udpxy.git \
    && cd udpxy/chipmunk \
    && make && make install

FROM ${ARCH}alpine:latest

COPY --from=builder /usr/local/bin/udpxy /usr/local/bin/udpxy
COPY --from=builder /usr/local/bin/udpxrec /usr/local/bin/udpxrec

EXPOSE 4000/tcp

# serve max 100 CCU
# Renew subscription each 180 secs (i.e. 3 mins)

ENTRYPOINT ["/usr/local/bin/udpxy"]
CMD ["-vTS", "-p", "4000", "-M", "180", "-c", "100"]
