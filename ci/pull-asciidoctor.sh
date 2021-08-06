#!/usr/bin/env bash

echo ${{ secrets.GITHUB_TOKEN }} | docker login ghcr.io -u $GITHUB_ACTOR --password-stdin
docker pull ghcr.io/$GITHUB_REPOSITORY/asciidoctor:latest || true
docker pull asciidoctor/docker-asciidoctor:latest
docker tag asciidoctor/docker-asciidoctor ghcr.io/$GITHUB_REPOSITORY/asciidoctor:latest
docker push ghcr.io/$GITHUB_REPOSITORY/asciidoctor:latest || true
