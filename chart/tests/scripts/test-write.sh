#!/bin/bash
set -ex

MAX_ATTEMPTS="${MAX_ATTEMPTS:-25}"
SLEEP_SECS="${SLEEP_SECS:-10}"

wait_until() {
  local tries=$MAX_ATTEMPTS
  while ! "$@"; do
    tries=$((tries-1))
    if [ "$tries" -le 0 ]; then
      echo "Timed out waiting for: $*"
      return 1
    fi
    sleep "$SLEEP_SECS"
  done    
}
retry_mc() {
  wait_until "$@"
}

attempt_counter=0
max_attempts=25
until [ $(mc --config-dir /test config host add bigbang ${MINIO_HOST}$(if [ -n "${MINIO_PORT}" ] ; then echo ":";fi)${MINIO_PORT} ${ACCESS_KEY} ${SECRET_KEY} >/dev/null; echo $?) -eq 0 ]; do
  if [ ${attempt_counter} -eq ${max_attempts} ];then
    echo "Max attempts reached"
    exit 1
  fi
  attempt_counter=$(($attempt_counter+1))
  sleep 10
done

wait_until curl -fsS "${MINIO_HOST%/}/minio/health/ready" >/dev/null
wait_until mc --config-dir /test ls bigbang >/dev/null 2>&1
wait_until mc --config-dir /test admin info bigbang >/dev/null 2>&1

# cleanup from pervious runs
mc --config-dir /test rb bigbang/foobar --force || true
mc --config-dir /test mb bigbang/foobar
mc --config-dir /test ls bigbang/foobar
base64 /dev/urandom | head -c 10000000 > /test/file.txt
md5sum /test/file.txt > /test/filesig
sync
retry_mc mc --config-dir /test cp /test/file.txt bigbang/foobar/file.txt
retry_mc mc --config-dir /test ls bigbang/foobar/file.txt
retry_mc mc --config-dir /test cp bigbang/foobar/file.txt /test/file.txt
retry_mc mc --config-dir /test rb bigbang/foobar --force
md5sum -c /test/filesig
