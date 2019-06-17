#!/bin/sh

BITBUCKET_ID=wuriyanto
BITBUCKET_TOKEN=$1

if [[ -z "$BITBUCKET_TOKEN" ]]; then
    echo "$0 require personal access token"
    echo "example : ./bitbucket_private_repo.sh 7djeksksuej"
    exit 1
fi

git config \
  --global \
  url."https://${BITBUCKET_ID}:${BITBUCKET_TOKEN}@privatebitbucket.com".insteadOf \
  "https://privatebitbucket.com"
