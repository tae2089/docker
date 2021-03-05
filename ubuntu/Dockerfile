FROM ubuntu:latest

RUN apt-get update && apt-get install -y sudo
RUN apt-get install -y git
RUN adduser --disabled-password --gecos "" ubuntu && echo 'ubuntu:ubuntu' | chpasswd  && adduser ubuntu sudo  && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN sudo mkdir -p /home/ubuntu

USER ubuntu
