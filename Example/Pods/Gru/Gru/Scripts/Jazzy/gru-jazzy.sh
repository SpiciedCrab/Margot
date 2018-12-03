#!/bin/bash

JAZZY=/usr/local/bin/jazzy

TARGET=${TARGET_NAME}
PROJECT=${TARGET/"_Example"/""}

DIR="$( cd .. "$(dirname)" && pwd)"
cd ${DIR}
echo "Jazzy in :${DIR} with project: ${PROJECT} "


JAZZY ${PROJECT} --swift-version 4.2 --podspec ${PROJECT}.podspec --min-acl internal
