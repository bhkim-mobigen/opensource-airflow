DIR="$( cd "$( dirname "$0" )" && pwd -P )"
cd $DIR/..

export DATA_CATALOG_SOLUTION_DATA=/DATA_CATALOG/data
export IMG_VERSION=0.1

docker-compose -f docker/docker-compose.yml build --force-rm data-catalog-airflow-webserver