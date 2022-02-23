#!/usr/bin/bash -eux

pipenv run sh -c "cd /work/streamlit ; make all-devel"
pipenv run sh -c "cd /work/streamlit ; make frontend"
