FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y curl jq git vim && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*
