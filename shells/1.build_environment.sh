#!/usr/bin/bash -eux

# git clone
export LANG=C
GITHUB_USER_NAME=u-masao
BRANCH_NAME=feature/add-https-support

if [ ! -d /work ] ; then
  mkdir /work
fi

cd /work
git clone https://github.com/${GITHUB_USER_NAME}/streamlit.git

cd /work/streamlit
git remote add remote https://github.com/streamlit/streamlit.git
git checkout develop
git submodule update --init
git pull origin $BRANCH_NAME 
git checkout $BRANCH_NAME

# pipenv
cd /work/streamlit/lib
export PIPENV_PIPFILE=
pipenv --python 3.8

# node
npm install -g npm
npm install -g n
npm install -g yarn
n 14.19.0
yarn config set strict-ssl false

# HTTPS certificate and key
if [ ! -d /content/certs ] ; then
  mkdir -p /content/certs
fi
cd /content/certs
openssl genrsa -aes256 -passout pass:gsahdg -out server.pass.key 4096
openssl rsa -passin pass:gsahdg -in server.pass.key -out server.key
openssl req -new -key server.key -out server.csr -subj "/CN=localhost"
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
rm server.pass.key server.csr
echo === HTTPS certificate and key file
ls -la 
