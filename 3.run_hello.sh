#!/usr/bin/bash -eux

export PIPENV_PIPFILE=/work/streamlit/lib/Pipfile
pipenv run sh -c "cd .. ; streamlit hello"
