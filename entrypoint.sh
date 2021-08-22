#!/bin/sh

THREAD_OPTS="-t $(($(nproc)/2))"
if [ "$THREADS" -gt 0 ]; then
    THREAD_OPTS="-t $THREADS"
fi

CPU_PRIORITY="0"
if [ "$PRIORITY" -ge 0 ] && [ "$PRIORITY" -le 5 ]; then
    CPU_PRIORITY=$PRIORITY
fi

exec xmrig --url=${POOL_URL} --algo=${POOL_ALGO} -user=${POOL_USER} ${THREAD_OPTS} \
    --cpu-priority=${CPU_PRIORITY}
