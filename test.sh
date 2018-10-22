#!/usr/bin/bash

set -e

# Multiple of 512B is important, as this is the read size of qemu-img convert/dd
head -c 4096 /dev/urandom > TEST.in

SOCKPATH=$PWD bash -x launcher serve_url TEST TEST.in &

sleep 2

qemu-img convert -O raw nbd:unix:$PWD/TEST TEST.out

kill %1

cmp TEST.in TEST.out
