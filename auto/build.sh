#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

VERSION="$( cat VERSION )"
REVISION="$( date +%d%H%S )"


rfc3339_now() {
  local now
  now="$( date +"%Y-%m-%dT%H:%M:%S%z" )"
  echo "${now:0:22}:${now:22}"
}


echo "Building version: $VERSION"

docker build \
  --tag ggicci/jupyter:latest \
  --tag ggicci/jupyter:$VERSION \
  --tag ccr.ccs.tencentyun.com/ggicci/jupyter:latest \
  --tag ccr.ccs.tencentyun.com/ggicci/jupyter:$VERSION \
  --build-arg arg_image_created="$( rfc3339_now )" \
  --build-arg arg_image_version="$VERSION" \
  --build-arg arg_image_revision="$REVISION" \
  .

