FROM azadehafzarhub/gitlab-ci-ubuntu-build:latest

LABEL maintainer="Mohammad Mahdi Baghbani Pourvahid <MahdiBaghbani@protonmail.com>"

# set frontend to noneinteractive.
ARG DEBIAN_FRONTEND=noninteractive

# install utils for comiling ruby interpreter.
# requirements from rbenv wiki at https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
RUN apt install --yes autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev \
zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev

# install rbenv.
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash || true

# setup rbenv path.
RUN echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.bash_profile
RUN echo "eval '$(rbenv init -)'" >> ~/.bash_profile

# check installation.
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash || true

# instal ruby versions.
RUN rbenv install 2.7.2
RUN rbenv install 3.0.0

#update bundler for all versions.
RUN rbenv global 2.7.2
RUN gem install bundler

RUN rbenv global 3.0.0
RUN gem install bundler

# choose global ruby version.
RUN rbenv global 3.0.0
