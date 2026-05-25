FROM ubuntu:resolute-20260421
ARG DEBIAN_FRONTEND=noninteractive
ENV HOME=/home/ubuntu

ADD --chmod=0644 https://downloads.claude.ai/keys/claude-code.asc \
    /etc/apt/keyrings/claude-code.asc
RUN echo "deb [signed-by=/etc/apt/keyrings/claude-code.asc] https://downloads.claude.ai/claude-code/apt/stable stable main" \
      > /etc/apt/sources.list.d/claude-code.list

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        build-essential \
        git gh \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
 && apt-get install -y --no-install-recommends claude-code \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /work
