FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS=yes

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y curl gnupg 

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list > /dev/null

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libbz2-dev \
    libffi-dev \
    libgl1-mesa-dev \
    liblzma-dev \
    libmysqlclient-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    llvm \
    make \
    mysql-client \
    python-openssl \
    rsync \
    tk-dev \
    unixodbc-dev \
    wget \
    xz-utils \
    zlib1g-dev \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    graphviz \
    libgconf-2-4 \
    libprotobuf-dev \
    npm \
    protobuf-compiler \
    python3-pip \
    python3-distutils \
    python3.8-dev \
    yarn \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip install pipenv

WORKDIR /content
