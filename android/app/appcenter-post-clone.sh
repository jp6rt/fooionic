#!/usr/bin/env bash

# fail if any command fails
# set -e
# debug log
set -x

# Required nodeJS version
NODE_VERSION=14.17.0

# workaround to override the v8 alias
npm config delete prefix
. ~/.bashrc
nvm install "$NODE_VERSION"
nvm alias node14 "$NODE_VERSION"

# go to root of project
cd ../..

echo "-------------------Debugging current directory"
pwd
ls

# install dependencies
npm install -g @ionic/cli
npm i

# copy the web assets to the native projects and updates the native plugins and dependencies based in package.json
ionic capacitor build android
