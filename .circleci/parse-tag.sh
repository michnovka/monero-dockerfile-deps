#!/bin/bash

# If Input CIRCLE_TAG="Bitcoin/0.17.0-1"
# Then Output:
# NODE_NAME:Bitcoin
# LATEST_TAG:0.17.0-1
# NODE_VERSION:0.17.0
# REVISION:1
# DOCKERHUB_REPO:btcpayserver/bitcoin
# DOCKERHUB_DESTINATION:btcpayserver/bitcoin:0.17.0-1
# DOCKERHUB_DOCKEFILE_ARM64:Bitcoin/0.17.0/linuxarm64v8.Dockerfile
# DOCKERHUB_DOCKEFILE_ARM32:Bitcoin/0.17.0/linuxarm32v7.Dockerfile
# DOCKERHUB_DOCKEFILE_AMD64:Bitcoin/0.17.0/linuxamd64.Dockerfile

SEPARATOR=$(expr index "$CIRCLE_TAG" "/")
NODE_NAME=${CIRCLE_TAG:0:$SEPARATOR-1}
REVISION=""
NODE_VERSION="${CIRCLE_TAG:$SEPARATOR}"
if expr index "$NODE_VERSION" "-" > /dev/null; then
SEPARATOR_REVISION=$(expr index "$NODE_VERSION" "-")
REVISION="${NODE_VERSION:$SEPARATOR_REVISION}"
NODE_VERSION="${NODE_VERSION:0:$SEPARATOR_REVISION-1}"
fi
LATEST_TAG="${CIRCLE_TAG:$SEPARATOR}"
DOCKERHUB_REPO="btcpayserver/$NODE_NAME"
DOCKERHUB_REPO="${DOCKERHUB_REPO,,}"
DOCKERHUB_DESTINATION="$DOCKERHUB_REPO:$LATEST_TAG"
DOCKERHUB_DOCKEFILE_ARM64="$NODE_NAME/$NODE_VERSION/linuxarm64v8.Dockerfile"
DOCKERHUB_DOCKEFILE_ARM32="$NODE_NAME/$NODE_VERSION/linuxarm32v7.Dockerfile"
DOCKERHUB_DOCKEFILE_AMD64="$NODE_NAME/$NODE_VERSION/linuxamd64.Dockerfile"

echo "LATEST_TAG=$LATEST_TAG"
echo "NODE_VERSION=$NODE_VERSION"
echo "REVISION=$REVISION"
echo "DOCKERHUB_REPO=$DOCKERHUB_REPO"
echo "DOCKERHUB_DESTINATION=$DOCKERHUB_DESTINATION"
echo "DOCKERHUB_DOCKEFILE_AMD64=$DOCKERHUB_DOCKEFILE_AMD64"
echo "DOCKERHUB_DOCKEFILE_ARM32=$DOCKERHUB_DOCKEFILE_ARM32"
echo "DOCKERHUB_DOCKEFILE_ARM64=$DOCKERHUB_DOCKEFILE_ARM64"
