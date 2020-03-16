FROM azadehafzarhub/gitlab-ci-ubuntu-build:latest

LABEL maintainer="Mohammad Mahdi Baghbani Pourvahid <MahdiBaghbani@protonmail.com>"

# install rbenv.
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash || true

# setup rbenv path.
RUN echo "export PATH='$HOME/.rbenv/bin:$PATH'" >> ~/.bash_profile
RUN echo "eval '$(rbenv init -)'" >> ~/.bash_profile

# check installation.
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash || true

# instal ruby versions.
RUN rbenv install 2.5.7
RUN rbenv install 2.6.5
RUN rbenv install 2.7.0

# choose global ruby version.
RUN rbenv global 2.7.0

