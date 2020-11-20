#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

VERSION="$( grep "image.version" Dockerfile | awk -F'[="]' '{print $3}' )"


echo "Pushing to tencent cloud..."

docker push ccr.ccs.tencentyun.com/ggicci/jupyter:${VERSION}

