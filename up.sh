#!/usr/bin/bash
_PWD=`pwd`
pushd `dirname $0` >/dev/null
. common.env
echo ${_UNAME}: >./home/.password
echo CONTAINER_NAME=${_NAME} >./home/.container.sh
docker run --gpus all --name ${_NAME} -d -p ${_SSHPORT}:${_SSHPORT} -v ${_PWD}:/workspace -v ./home:${_HOMEDIR} -e UNAME=${_UNAME} -e GNAME=${_GNAME} -e UID=${_UID} -e GID=${_GID} -e HOMEDIR=${_HOMEDIR} -e CONTAINER_NAME=${_NAME} -e COMMAND=sleep -e OPENAI_API_KEY=${OPENAI_API_KEY} ${_NAME}
popd >/dev/null
