#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

VERSION="$( cat VERSION )"

echo "Pushing to tencent cloud..."

docker push ccr.ccs.tencentyun.com/ggicci/jupyter:${VERSION}
docker push ccr.ccs.tencentyun.com/ggicci/jupyter:latest

