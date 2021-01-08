#!/bin/bash
docker run --rm \
  -e PLUGIN_FROM=drone@DOMAIN.TLD \
  -e PLUGIN_HOST=smtp.mailgun.org \
  -e PLUGIN_USERNAME="postmaster@DOMAIN.TLD" \
  -e PLUGIN_PASSWORD="d93c4eac9-AFAKEPASSWORD-63bef1c4" \
  -e DRONE_COMMIT_SHA=$1 \
  -e DRONE_COMMIT_BRANCH=$2 \
  -e DRONE_COMMIT_AUTHOR=$3 \
  -e DRONE_REPO_OWNER=$4 \
  -e DRONE_REPO_NAME=$5 \
  -e DRONE_COMMIT_AUTHOR_EMAIL=$6 \
  -e DRONE_BUILD_NUMBER=$7 \
  -e DRONE_BUILD_STATUS=success \
  -e DRONE_BUILD_LINK=$8 \
  -e DRONE_COMMIT_MESSAGE="Check the above link for the message" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  drillster/drone-email
