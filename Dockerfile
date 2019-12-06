FROM ubuntu:bionic

MAINTAINER Mohammad Mahdi Baghbani Pourvahid <MahdiBaghbani@protonmail.com>

# update apt database.
RUN apt-get update -y

# install curl.
RUN apt-get install -y curl

# install gnupg.
RUN apt-get install -y gnupg

# install ruby version manager (rvm) using curl, then install stable ruby with rvm.
RUN gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io
RUN source /usr/local/rvm/scripts/rvm

# install required ruby versions. 
RUN rvm install 2.3
RUN rvm install 2.4
RUN rvm install 2.5
RUN rvm install 2.6

# install codeclimate coverage reporter.
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/bin/cc-test-reporter
RUN chmod +x /usr/bin/cc-test-reporter

# specify working directory.
ENV TESTBUILD ~/test_and_build
RUN mkdir -p $TESTBUILD
WORKDIR $TESTBUILD
