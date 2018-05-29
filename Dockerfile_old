FROM debian:stretch-slim

MAINTAINER Tim Sobisch

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && \
 apt-get -y --no-install-recommends install socat && \
 apt-get autoremove && \
 apt-get clean && \
 rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bash","/entrypoint.sh"]
