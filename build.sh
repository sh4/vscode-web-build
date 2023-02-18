#!/bin/sh

if [ -z "$BUILD_ROOT" ]; then
  BUILD_ROOT=/app
fi

code_web_package="$BUILD_ROOT/out/vscode-web-$(git -C $BUILD_ROOT/vscode name-rev --name-only HEAD | sed -e 's/tags\///g' | sed -e 's/\//-/g').zip"

yarn --cwd $BUILD_ROOT/vscode &&
yarn --cwd $BUILD_ROOT/vscode gulp vscode-web-min &&
mkdir -p $BUILD_ROOT/out && \
rm -f $code_web_package && \
( cd $BUILD_ROOT/vscode-web && zip -1 -r $code_web_package . )
