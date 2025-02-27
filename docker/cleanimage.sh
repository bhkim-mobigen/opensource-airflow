DIR="$( cd "$( dirname "$0" )" && pwd -P )"
cd $DIR/..
docker image prune -f