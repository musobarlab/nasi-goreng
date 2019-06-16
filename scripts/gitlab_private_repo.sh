#!/bin/sh

git config \
  --global \
  url."https://${user}:${personal_access_token}@privategitlab.com".insteadOf \
  "https://privategitlab.com"
