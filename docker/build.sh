DIR="$( cd "$( dirname "$0" )" && pwd -P )"
cd $DIR/..

export DATA_CATALOG_SOLUTION_DATA=/DATA_CATALOG/data

docker-compose -f docker/docker-compose.yml build --force-rm airflow-webserver