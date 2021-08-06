#!/usr/bin/env bash

echo $1 | docker login ghcr.io -u $GITHUB_ACTOR --password-stdin || exit 1
docker pull ghcr.io/$GITHUB_REPOSITORY/asciidoctor:latest
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "asciidoctor not found in ghcr.io, pulling"
    docker pull asciidoctor/docker-asciidoctor:latest
    docker tag asciidoctor/docker-asciidoctor ghcr.io/$GITHUB_REPOSITORY/asciidoctor:latest
    docker push ghcr.io/$GITHUB_REPOSITORY/asciidoctor:latest || true
else
    echo "tagging asciidoctor"
    docker tag ghcr.io/$GITHUB_REPOSITORY/asciidoctor:latest asciidoctor/docker-asciidoctor:latest
fi
