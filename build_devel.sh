#!/usr/bin/bash -eux

export PIPENV_PIPFILE=/work/streamlit/lib/Pipfile
pipenv run sh -c "cd /work/streamlit ; make all-devel"
pipenv run sh -c "cd /work/streamlit ; make make frontend"
pipenv run sh -c "cd /work/streamlit/frontend; HTTPS=true yarn start"
