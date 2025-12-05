#!/bin/bash

# DB 초기화 (이미 초기화된 경우 안전하게 스킵됨)
if ! airflow db check-migrations > /dev/null 2>&1; then
  echo "Initializing Airflow database..."
  airflow db init
  airflow users create --username admin --firstname FIRST_NAME --lastname LAST_NAME --role Admin --email admin@example.org -p admin || true
fi

airflow webserver
