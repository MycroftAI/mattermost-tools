#!/usr/bin/env bash
# export registry_server=""
# export mattermost_docker_dir=""

function build_app {
    cd ${TOP}/app
    docker build -t ${registry_server}/mattermost-app:latest -f `pwd`/Dockerfile-enterprise .
    docker push ${registry_server}/mattermost-app:latest
}

function build_db {
    cd ${TOP}/db
    docker build -t ${registry_server}/mattermost-db:latest -f `pwd`/Dockerfile .
    docker push ${registry_server}/mattermost-app:latest
}

function build_web {
    cd ${TOP}/web
    docker build -t ${registry_server}/mattermost-db:latest -f `pwd`/Dockerfile .
    docker push ${registry_server}/mattermost-app:latest
}

cd ${mattermost_docker_dir}
TOP=.

build_app
build_db
build_web

