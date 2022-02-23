#!/usr/bin/bash -eux

pipenv run sh -c "cd /work/streamlit ; make pytest"
pipenv run sh -c "cd /work/streamlit ; make jstest"
# pipenv run sh -c "cd /work/streamlit ; PYTHONPATH=lib pytest lib/tests/streamlit/server_test.py -k test_start_stop"
