#!/bin/bash
set -e
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}" 

# Check if running in GitHub Actions - if so, use ghcr.io repo, otherwise use local
if [[ -n "${GITHUB_ACTIONS}" ]]; then
  [[ -z "${docker_username}" ]] && REPO="" || REPO="ghcr.io/$docker_username/"
else
  REPO=""
fi

echo "Using repository prefix: ${REPO}"
docker build -t "${REPO}micronaut-app:latest" -t "${REPO}micronaut-app:1.0-$Tag" app/
