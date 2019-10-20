FROM pytorch/pytorch:0.4_cuda9_cudnn7

ENV TERM screen-256color

# Install Ruby and Rails dependencies
RUN apt-get update && apt-get install -y \
  git \
  tmux \
  vim \
  build-essential \
  cmake \
  python3-dev \

# Clone dotfiles
RUN git clone --bare git://github.com/yys8646/dotfiles.git $HOME/.dotfiles
RUN /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout master -- '.*'

# vim Vundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# need to run :PluginInstall from vim
RUN vim -c ':PluginInstall' -c 'qa!'
RUN python3 /root/.vim/bundle/youcompleteme/install.py

# Do source ~/.bashrc in terminal
# source ~/.bashrc
