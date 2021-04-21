#!/bin/bash

set -x

#啟動init_redis
redis-server /usr/local/etc/redis/redis.conf &
wait
exec "$@"
