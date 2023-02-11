#! /bin/bash

./stop.sh

docker rmi $(docker images --filter=reference='lingmiaojh-bot*:*' -q -a)

./start.sh