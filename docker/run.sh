DIR="$( cd "$( dirname "$0" )" && pwd -P )"
cd $DIR/..

export DATA_CATALOG_SOLUTION_DATA=/DATA_CATALOG/data
export IMG_VERSION=0.1

if [ -z "$1" ]; then
    docker-compose -f docker/docker-compose.yml up -d
else
    docker-compose -f docker/docker-compose.yml up -d "$1"
fi

