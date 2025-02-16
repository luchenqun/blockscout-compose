#!/usr/bin/env bash
CMD=$1

case ${CMD} in
start)
    echo "===== start ===="
    sudo docker-compose -f mud.yml down
    sudo docker-compose -f mud.yml up -d
    sleep 3
    sudo docker ps -a
    echo "===== end ===="
    ;;
stop)
    echo "===== stop ===="
    sudo docker-compose -f mud.yml down
    sleep 3
    sudo docker ps -a
    echo "===== end ===="
    ;;
reset)
    echo "===== reset ===="
    sudo docker-compose -f mud.yml down
    sleep 3
    cd ./services && sudo rm -rf blockscout-db-data logs redis-data stats-db-data && cd ..
    sudo docker-compose -f mud.yml up -d
    sleep 3
    sudo docker ps -a
    echo "===== end ===="
    ;;
*)
    echo "Usage: deploy.sh start | stop | reset"
    ;;
esac
