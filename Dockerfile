FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl mysql-client libmysqlclient-dev unixodbc-dev

RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

RUN apt-get update && apt-get install -y graphviz python3-distutils

RUN apt-get update && apt-get install yarn npm python-pip protobuf-compiler libgconf-2-4

RUN pip install pipenv

