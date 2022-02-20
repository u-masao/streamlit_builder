#!/usr/bin/bash


LANG=C
GITHUB_USER_NAME=u-masao
BRANCH_NAME=feature/add-https-support

cd /
mkdir /work
cd /work/
git clone https://github.com/${GITHUB_USER_NAME}/streamlit.git

cd streamlit/
git remote add remote https://github.com/streamlit/streamlit.git
git checkout develop
git submodule update --init
git pull origin $BRANCH_NAME 
git checkout $BRANCH_NAME

cd lib
pipenv --python 3.8
pipenv shell
