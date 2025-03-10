#!/bin/bash
set -e
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}" 
# if docker username is not set, set REPO to empty string
docker_username=${DOCKER_USERNAME:-}
[[ -z "${docker_username}" ]] && REPO="" || REPO="ghcr.io/$docker_username/"
echo "${REPO}"
docker build -t "${REPO}micronaut-app:latest" -t "${REPO}micronaut-app:1.0-$Tag" app/
