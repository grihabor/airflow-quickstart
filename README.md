# airflow-quickstart
Minimal docker-compose and Dockerfile to run local airflow with postgres and celery

## Run
```bash
make up
```

## Generate constraints.txt
```bash
pip install pip-tools
make update-constraints
```
