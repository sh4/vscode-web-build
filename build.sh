#!/bin/sh

cd vscode

# Resolve dependencies
yarn

# Build minimum code-web environment
yarn gulp vscode-web-min
