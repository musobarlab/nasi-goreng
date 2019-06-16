#!/bin/sh

USERNAME=wuriyanto48
PERSONAL_ACCESS_TOKEN=$1

if [[ -z "$PERSONAL_ACCESS_TOKEN" ]]; then
    echo "$0 require personal access token"
    echo "example : ./github_private_repo.sh 7djeksksuej"
    exit 1
fi

git config \
  --global \
  url."https://${USERNAME}:${PERSONAL_ACCESS_TOKEN}@github.com".insteadOf \
  "https://github.com"
