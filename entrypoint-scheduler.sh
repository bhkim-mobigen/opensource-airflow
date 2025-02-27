#!/bin/bash

TIMEOUT=30
WAIT_INTERVAL=1
ELAPSED_TIME=0

echo "waiting airflow init db"

while [ ! -f "/airflow/initflag" ]; do
  sleep $WAIT_INTERVAL
  ELAPSED_TIME=$((ELAPSED_TIME + WAIT_INTERVAL))

  if [ $ELAPSED_TIME -ge $TIMEOUT ]; then
    echo "waiting Airflow init db : timeout"
    exit 1
  fi
done

echo "start scheduler"

airflow scheduler
