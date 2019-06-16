#!/bin/bash

git config \
  --global \
  url."https://${bitbucket_id}:${bitbucket_token}@privatebitbucket.com".insteadOf \
  "https://privatebitbucket.com"
