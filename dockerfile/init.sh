#!/bin/sh

create_repo(){
  REPO_NAME="$1"
  REPO_PATH="/git/${REPO_NAME}.git"
  if [ ! -d "${REPO_PATH}" ]; then
    cd /git; git init --bare ${REPO_NAME}.git; cd ${REPO_PATH}; git config http.receivepack true
    chown -R root:root ${REPO_PATH}
    echo "[init script] Created git repo: ${REPO_PATH}"
  fi
}

import_repo(){
  REPO_NAME="$1"
  REPO_PATH="/git/${REPO_NAME}"
  echo "[init script] Discovered git repo: ${REPO_PATH}"
  cd ${REPO_PATH}; git config http.receivepack true
  echo "[init script] Imported git repo: ${REPO_PATH}"
}

if [ ! -z "${INIT_REPOS}" ];then
  for i in $(echo ${INIT_REPOS} | tr "," "\n")
  do
    create_repo ${i}
  done
else
  echo "[init script] Env INIT_REPOS is empty. skipping initial."
fi

if [[ ! -z "${AUTH_ENABLE}" ]] && [[ ! -z "${AUTH_USER}" ]] && [[ ! -z "${AUTH_PASSWORD}" ]];then
    htpasswd -m -c -b /root/auth ${AUTH_USER} ${AUTH_PASSWORD}
    sed -i 's/\#auth/auth/g' /etc/nginx/nginx.conf
else
  echo "[init script] Env ENABLE_AUTH, AUTH_USER, AUTH_PASSWORD are empty, auth disabled."
fi
  

## Import existing repos
for i in $(ls /git)
do
  import_repo ${i}
done


# launch fcgiwrap via spawn-fcgi; launch nginx in the foreground
# so the container doesn't die on us; supposedly we should be
# using supervisord or something like that instead, but this
# will do
spawn-fcgi -s /run/fcgi.sock /usr/bin/fcgiwrap && \
    nginx -g "daemon off;"
