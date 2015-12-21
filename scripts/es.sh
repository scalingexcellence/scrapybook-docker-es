#!/bin/sh
# ES service

export ES_HEAP_SIZE=256m

exec /sbin/setuser elasticsearch elasticsearch
