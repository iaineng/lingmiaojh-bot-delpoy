#! /bin/bash

./stop.sh

cd app-db || exit
tar -cvJf "data_$(TZ=UTC date +%Y-%m-%dT%H.%M.%S.%NZ).tar.xz" data
cd ..
