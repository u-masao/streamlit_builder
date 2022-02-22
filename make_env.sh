#!/usr/bin/bash -eux

export LANG=C
GITHUB_USER_NAME=u-masao
BRANCH_NAME=feature/add-https-support

if [ ! -d /work ] ; then
  mkdir /work
fi

cd /work/
git clone https://github.com/${GITHUB_USER_NAME}/streamlit.git

cd streamlit/
git remote add remote https://github.com/streamlit/streamlit.git
git checkout develop
git submodule update --init
git pull origin $BRANCH_NAME 
git checkout $BRANCH_NAME

npm install -g npm
npm install -g n
npm install -g yarn
n 14.19.0
yarn config set strict-ssl false

cd lib
pipenv --python 3.8

echo "TODO:  cd /work/streamlit/lib ; pipenv run sh -c 'make all-devel frontend'; cd frontend ; yarn start"
