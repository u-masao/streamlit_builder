#!/usr/bin/bash -eux

npm install -g npm
npm install -g n
npm install -g yarn
n 14.19.0
yarn config set strict-ssl false

export PIPENV_PIPFILE=/work/streamlit/lib/Pipfile
pipenv run sh -c "cd /work/streamlit ; make all-devel"
pipenv run sh -c "cd /work/streamlit ; make make frontend"
pipenv run sh -c "cd /work/streamlit/frontend; yarn start"
# pipenv run sh -c "cd /work/streamlit/frontend; HTTPS=true yarn start"
