#!/usr/bin/bash

cd /work/streamlit/lib
pipenv run sh -c "cd /work/streamlit ; make all-devel"
pipenv run sh -c "cd /work/streamlit ; make make frontend"
pipenv run sh -c "cd /work/streamlit/frontend; HTTPS=true yarn start"
