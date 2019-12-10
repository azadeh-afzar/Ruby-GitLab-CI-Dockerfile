FROM ubuntu:bionic

MAINTAINER Mohammad Mahdi Baghbani Pourvahid <MahdiBaghbani@protonmail.com>

# set frontend to noneinteractive.
ARG DEBIAN_FRONTEND=noninteractive

# change default shell from sh to bash.
SHELL ["/bin/bash", "-l", "-c"]

# update apt database.
RUN apt-get update --assume-yes

# install apt utils to speed up configs.
RUN apt-get install --assume-yes --no-install-recommends apt-utils

# install git.
RUN apt-get install git

# install curl.
RUN apt-get install --assume-yes curl

# install gnupg.
RUN apt-get install --assume-yes gnupg

# install codeclimate coverage reporter.
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/bin/cc-test-reporter
RUN chmod +x /usr/bin/cc-test-reporter

# add rvm keys.
RUN gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# install ruby version manager (rvm) using curl.
RUN \curl -sSL https://get.rvm.io | bash -s stable

# setup rvm.
RUN echo "source /etc/profile.d/rvm.sh" >> ~/.bash_profile

# add rvm binary to path.
RUN echo "export PATH=${PATH}:/usr/local/rvm/bin" >> ~/.bash_profile

# install rvm requirements.
RUN rvm requirements

# specify working directory.
ENV TESTBUILD ~/test_and_build
RUN mkdir -p $TESTBUILD
WORKDIR $TESTBUILD

