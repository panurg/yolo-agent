FROM ubuntu:resolute-20260421

ENV HOME=/home/ubuntu

COPY build /tmp/build
RUN DEBIAN_FRONTEND=noninteractive /tmp/build && rm /tmp/build

WORKDIR /work
