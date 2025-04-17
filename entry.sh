#!/usr/bin/bash
pushd `dirname $0` >/dev/null
. common.env
popd >/dev/null
docker exec -it ${_NAME} /usr/bin/su ${_UNAME}
