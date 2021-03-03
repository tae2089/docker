From ubuntu:latest
ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y python3 python3-pip
RUN echo "alias python=python3" >> ~/.bash_aliases && \
    echo "alias pip=pip3" >> ~/.bash_aliases
RUN /bin/bash -c "source ~/.bash_aliases"
