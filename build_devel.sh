#!/usr/bin/bash

# https://github.com/streamlit/streamlit/wiki/Contributing#how-to-develop-streamlit

cd /work/streamlit/lib
pipenv run sh -c "cd /work/streamlit ; make all-devel"
