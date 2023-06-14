FROM python:3.11
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

