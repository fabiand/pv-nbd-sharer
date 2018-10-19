#!/usr/bin/bash
date > TEST.in

SOCKPATH=$PWD bash -x launcher serve_url TEST TEST.in &

sleep 3

qemu-img dd bs=1 if=nbd:unix:$PWD/TEST of=TEST.out

kill %1

diff -au TEST.in TEST.out
