#!/usr/bin/bash -eux

cd /content/tmp
echo -e "import streamlit as st\nst.title('hello')" > app.py
# pipenv run sh -c "streamlit run app.py"
pipenv run sh -c "streamlit run app.py --server.sslCertFile=/content/certs/server.crt --server.sslKeyFile=/content/certs/server.key --server.address=localhost"
