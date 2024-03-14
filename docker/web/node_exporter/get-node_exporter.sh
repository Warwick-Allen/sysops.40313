#!/usr/bin/sh -x

VERSION=1.7.0
OS=linux
ARCHITECTURE=amd64
URL_PATH=prometheus/node_exporter/releases/download/v$VERSION
ARCHIVE=node_exporter-$VERSION.$OS-$ARCHITECTURE.tar.gz
if [ ! -e $ARCHIVE ]
then
  wget https://github.com/$URL_PATH/$ARCHIVE
fi
