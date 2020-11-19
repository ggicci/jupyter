#!/usr/bin/env bash

rfc3339_now() {
  local now
  now="$( date +"%Y-%m-%dT%H:%M:%S%z" )"
  echo "${now:0:22}:${now:22}"
}

docker build \
  --tag ggicci/jupyter:latest \
  --tag ccr.ccs.tencentyun.com/ggicci/jupyter:latest \
  --build-arg arg_image_created="$( rfc3339_now )" \
  .
