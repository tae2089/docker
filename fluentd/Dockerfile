FROM tae2089/ubuntu:1.1
RUN sudo apt-get update
RUN sudo apt-get install -y git-core curl wget gcc patch make bzip2 autoconf automake libtool bison curl 
RUN git clone git://github.com/sstephenson/rbenv.git .rbenv
RUN git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"
RUN ~/.rbenv/bin/rbenv install -v 2.7.2
RUN ~/.rbenv/bin/rbenv global 2.7.2
RUN type rbenv
