#!/usr/bin/bash -eux

# pipenv run sh -c "cd /work/streamlit/frontend; yarn start"
pipenv run sh -c "cd /work/streamlit/frontend; HTTPS=true yarn start"
