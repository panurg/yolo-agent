FROM ubuntu:resolute-20260421
ARG DEBIAN_FRONTEND=noninteractive
ENV HOME=/home/ubuntu

COPY --chmod=0644 claude-code.asc /etc/apt/keyrings/claude-code.asc
COPY claude-code.list /etc/apt/sources.list.d/claude-code.list

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        ca-certificates \
        build-essential \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        git gh \
        jq \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
 && apt-get install -y --no-install-recommends claude-code \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /work
