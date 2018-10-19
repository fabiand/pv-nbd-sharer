#!/usr/bin/bash
head -c 512 /dev/urandom | tee TEST.in

SOCKPATH=$PWD bash -x launcher serve_url TEST TEST.in &

sleep 3

qemu-img convert -O raw nbd:unix:$PWD/TEST TEST.out

kill %1

cmp TEST.in TEST.out
