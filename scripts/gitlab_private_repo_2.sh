#!/bin/sh

USERNAME=Wuriyanto
PERSONAL_ACCESS_TOKEN=$1

if [[ -z "$PERSONAL_ACCESS_TOKEN" ]]; then
    echo "$0 require personal access token"
    echo "example : ./gitlab_private_repo.sh 7djeksksuej"
    exit 1
fi

echo -e "machine gitlab.com\nlogin ${USERNAME}\npassword ${PERSONAL_ACCESS_TOKEN}" >> ~/.netrc

cat ~/.netrc

export GOPRIVATE=gitlab.com/${USERNAME}/*

# git config \
#   --global --add \
#   url."ssh://git@gitlab.com:/".insteadOf \
#   "https://gitlab.com/"
