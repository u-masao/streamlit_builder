#!/usr/bin/bash -eux

openssl genrsa -aes256 -passout pass:gsahdg -out server.pass.key 4096
openssl rsa -passin pass:gsahdg -in server.pass.key -out server.key
openssl req -new -key server.key -out server.csr -subj "/CN=localhost"
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
rm server.pass.key server.csr
echo -e "import streamlit as st\nst.title('hello')" > app.py
export PIPENV_PIPFILE=/work/streamlit/lib/Pipfile
pipenv run sh -c "streamlit run app.py --server.sslCertFile=server.crt --server.sslKeyFile=server.key --server.address=localhost"
