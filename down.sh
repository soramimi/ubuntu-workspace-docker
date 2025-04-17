#!/usr/bin/bash
pushd `dirname $0` >/dev/null
. common.env
popd >/dev/null
docker kill ${_NAME}
docker rm ${_NAME}
