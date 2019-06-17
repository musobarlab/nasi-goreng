#!/bin/sh

USERNAME=wuriyanto
PERSONAL_ACCESS_TOKEN=$1

if [[ -z "$PERSONAL_ACCESS_TOKEN" ]]; then
    echo "$0 require personal access token"
    echo "example : ./gitlab_private_repo.sh 7djeksksuej"
    exit 1
fi

git config \
  --global \
  url."https://${USERNAME}:${PERSONAL_ACCESS_TOKEN}@privategitlab.com".insteadOf \
  "https://privategitlab.com"
