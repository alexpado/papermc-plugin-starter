#!/bin/bash

if [[ -z "$PAPER_VERSION" ]]; then
  if [[ -z "$1" ]]; then
    echo "Please set the PAPER_VERSION variable to the minecraft version you wish to use."
    echo "Example: 1.19"
    exit 1
  fi
  PAPER_VERSION=$1
fi

echo "Listing builds for PaperMC $PAPER_VERSION..."
curl --silent "https://api.papermc.io/v2/projects/paper/version_group/$PAPER_VERSION/builds" | jq '.builds' > builds.json

if [[ -z "$PAPER_BUILD" ]]; then
  # Use the latest
  echo "PAPER_BUILD variable not set. Finding latest build..."
  jq '.[-1]' builds.json > build.json
  PAPER_BUILD=$(jq -r '.build' build.json)
else
  echo "Finding build $PAPER_BUILD..."
  jq "$(echo '.[] | select(.build ==' $PAPER_BUILD ')')" builds.json > build.json
fi

MC_VERSION=$(jq -r '.version' build.json)
MC_NAME=$(jq -r '.downloads.application.name' build.json)
MC_SHA256=$(jq -r '.downloads.application.sha256' build.json)
DL_URL=$(echo "https://api.papermc.io/v2/projects/paper/versions/$MC_VERSION/builds/$PAPER_BUILD/downloads/$MC_NAME")

echo "Downloading build server file (from $DL_URL) ..."
curl --silent $DL_URL --output papermc.jar

echo "Cleaning up..."
rm build.json builds.json

echo "Checking checksum..."
echo "$MC_SHA256 papermc.jar" | sha256sum --check --status

if [ $? -ne 0 ]; then
    echo "Checksum check failed."
    echo "  EXPECTING: $MC_SHA256"
    echo "        GOT:" $(sha256sum papermc.jar | awk '{print $1}')
    rm papermc.jar
    exit 1
fi

echo "The jar file for PaperMC $PAPER_VERSION build $PAPER_BUILD has been downloaded."
