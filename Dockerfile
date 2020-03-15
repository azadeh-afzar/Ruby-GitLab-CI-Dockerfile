FROM azadehafzarhub/gitlab-ci-ubuntu-build:ready

MAINTAINER Mohammad Mahdi Baghbani Pourvahid <MahdiBaghbani@protonmail.com>

# install rbenv.
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

# setup rbenv path.
RUN echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.bash_profile
RUN echo "eval '$(rbenv init -)'" >> ~/.bash_profile

# check installation.
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# instal ruby versions.
RUN rbenv install 2.1.10
RUN rbenv install 2.2.10
RUN rbenv install 2.3.8
RUN rbenv install 2.4.9
RUN rbenv install 2.5.7
RUN rbenv install 2.6.5
RUN rbenv install 2.7.0

# choose global ruby version.
RUN rbenv global 2.7.0

# specify working directory.
ENV TESTBUILD ~/test_and_build
RUN mkdir -p $TESTBUILD
WORKDIR $TESTBUILD

