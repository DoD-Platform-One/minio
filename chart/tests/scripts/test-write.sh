#!/bin/bash
set -ex

# default values based on 40/3 -- same as velero backup-restore.sh script
MAX_ATTEMPTS="${MAX_ATTEMPTS:-40}"
SLEEP_SECS="${SLEEP_SECS:-3}"
MINIO_URL="${MINIO_HOST%/}/minio/health/ready"

CURL_RETRY_COUNT=40         # Number of retry attempts
CURL_RETRY_DELAY=3          # Delay (in seconds) between retries
CURL_CONNECT_TIMEOUT=120    # Maximum time (in seconds) to wait for a connection
CURL_RETRY_MAX_TIME=120     # Maximum total time (in seconds) for retries

retry_cmd() {
  local tries=$MAX_ATTEMPTS
  while ! "$@"; do
    tries=$((tries-1))
    if [ "$tries" -le 0 ]; then
      echo "Timed out waiting for: $*"
      exit 1
    fi
    sleep "$SLEEP_SECS"
  done    
}

echo "Ensuring MinIO endpoint up and available"
if curl --retry $CURL_RETRY_COUNT \
        --retry-delay $CURL_RETRY_DELAY \
        --retry-connrefused \
        --connect-timeout $CURL_CONNECT_TIMEOUT \
        --max-time $CURL_RETRY_MAX_TIME \
        -sIS $MINIO_URL &>/dev/null; then
  echo "Success: MinIO is up."
else
  echo "Failure: Cannot hit MinIO endpoint after $CURL_RETRY_COUNT attempts."
  echo "Debug information (curl response):"
  curl -v "$MINIO_URL"
  exit 1
fi

retry_cmd mc --config-dir /test alias set bigbang ${MINIO_HOST} ${ACCESS_KEY} ${SECRET_KEY}
retry_cmd mc --config-dir /test ls bigbang
retry_cmd mc --config-dir /test admin info bigbang

# cleanup from pervious runs
mc --config-dir /test rb bigbang/foobar --force || true
mc --config-dir /test mb bigbang/foobar
mc --config-dir /test ls bigbang/foobar
base64 /dev/urandom | head -c 10000000 > /test/file.txt
md5sum /test/file.txt > /test/filesig
sync
retry_cmd mc --config-dir /test cp /test/file.txt bigbang/foobar/file.txt
retry_cmd mc --config-dir /test ls bigbang/foobar/file.txt
retry_cmd mc --config-dir /test cp bigbang/foobar/file.txt /test/file.txt
retry_cmd mc --config-dir /test rb bigbang/foobar --force
md5sum -c /test/filesig
