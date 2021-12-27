FROM ubuntu:latest

RUN apt-get update && apt-get install -y sudo
RUN apt-get install -y git
RUN adduser --disabled-password --gecos "" ubuntu && echo 'ubuntu:ubuntu' | chpasswd  && adduser ubuntu sudo  && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN sudo mkdir -p /home/ubuntu

USER ubuntu
WORKDIR /home/ubuntu

RUN sudo ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-11-jre-headless && \
    sudo apt-get install -y vim \
    sudo apt-get clean;