#!/bin/sh

code_web_package="/app/out/vscode-web-$(git -C /app/vscode name-rev --name-only HEAD | sed -e 's/tags\///g' | sed -e 's/\//-/g').zip"

yarn --cwd /app/vscode &&
yarn --cwd /app/vscode gulp vscode-web-min &&
mkdir -p /app/out && \
rm -f $code_web_package && \
( cd /app/vscode-web && zip -1 -r $code_web_package . )
