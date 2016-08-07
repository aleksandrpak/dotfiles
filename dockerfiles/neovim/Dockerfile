FROM phusion/baseimage:latest

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get install software-properties-common

RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update
RUN apt-get install -y neovim

RUN apt-get install -y python-dev python-pip python3-dev python3-pip

RUN pip2 install --upgrade pip
RUN pip3 install --upgrade pip

RUN pip2 install --upgrade neovim
RUN pip3 install --upgrade neovim

RUN apt-get install -y git

RUN curl -fLo /root/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY plugins.vim /plugins.vim
RUN nvim -E -u NONE -S /plugins.vim +PlugInstall +qall
RUN rm -f /plugins.vim

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
