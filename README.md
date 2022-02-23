streamlit builder
=================


## how to use

### start docker container

```shell
docker-compose build
docker-compose up
```

### build environment, test and install


```shell
docker-compose exec builder bash
cd shells
./1.build_env.sh
./2.build_devel.sh
./6.test.sh
./7.install.sh
./8.run_https_app.sh
```

firefox https://localhost:8501/
