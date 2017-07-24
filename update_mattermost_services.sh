#!/usr/bin/env bash
#export docker_registry=""

docker service update mattermost_prod_db --image ${docker_resistry}/mattermost-db:latest --detach=false
docker service update mattermost_prod_app --image ${docker_registry}/mattermost-app:latest --detach=false
docker service update mattermost_prod_web --image ${docker_registry}/mattermost-web:latest --detach=false

