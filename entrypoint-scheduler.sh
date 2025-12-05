#!/bin/bash

TIMEOUT=60
WAIT_INTERVAL=3
ELAPSED_TIME=0

echo "waiting airflow db check-migrations"

until airflow db check-migrations; do
  sleep $WAIT_INTERVAL
  ELAPSED_TIME=$((ELAPSED_TIME + WAIT_INTERVAL))

  if [ $ELAPSED_TIME -ge $TIMEOUT ]; then
    echo "waiting airflow db check-migrations : timeout"
    exit 1
  fi
done

echo "start scheduler"

airflow scheduler
