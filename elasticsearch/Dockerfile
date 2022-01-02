FROM ubuntu:latest

RUN apt-get update && apt-get install -y sudo
RUN apt-get install -y git
RUN adduser --disabled-password --gecos "" ubuntu && echo 'ubuntu:ubuntu' | chpasswd  && adduser ubuntu sudo  && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN sudo mkdir -p /home/ubuntu

USER ubuntu
WORKDIR /home/ubuntu

RUN sudo ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

RUN sudo apt-get update && \
    sudo apt-get install -y vim curl wget rpm &&\
    sudo apt-get clean;

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.2-linux-aarch64.tar.gz && \
    tar -xvzf elasticsearch-7.16.2-linux-aarch64.tar.gz && \
    mv elasticsearch-7.16.2 elasticsearch
