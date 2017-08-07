#!/bin/sh

CONTAINER="node:8-alpine"

# Always pull latest image
docker pull $CONTAINER

docker run \
  --rm -it \
  --name=npm-$(( $RANDOM % 99999 )) \
  -v $(pwd):/app \
  -w "/app" \
  $CONTAINER npm --quiet ${*}
