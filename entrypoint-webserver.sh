#!/bin/bash

if [ ! "$(ls -A /airflow/initflag)" ]; then
  airflow db init
  airflow users create --username admin --firstname FIRST_NAME --lastname LAST_NAME  --role Admin --email admin@example.org
  touch /airflow/initflag
fi

airflow webserver
