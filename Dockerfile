FROM python:3.11

# install gosu, required by airflow-init
RUN \
    --mount=type=cache,target=/var/cache/apt \
    set -eux \
 && apt-get update \
 && apt-get install -y gosu \
 && gosu nobody true # verify that the binary works

WORKDIR /opt/airflow

ADD requirements.txt constraints.txt .
RUN \
    --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt -c constraints.txt

# create airflow user
RUN useradd -u 50000 -ms /bin/bash airflow
USER airflow
ENV AIRFLOW_HOME=/home/airflow
WORKDIR /home/airflow
ADD airflow.cfg .

