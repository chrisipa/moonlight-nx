#!/bin/bash

# Exit with an error code if any of the commands fail
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# Run build
make -j NIGHTLY_BUILD=`git rev-parse --short "$GITHUB_SHA"`

# Copy to Nintendo Switch with nxlink
if [ "$SWITCH_HOST" != "" ]
then
    nxlink --address $SWITCH_HOST moonlight.nro
fi