[![Build Status](https://travis-ci.com/fabiand/pv-nbd-sharer.svg?branch=master)](https://travis-ci.com/fabiand/pv-nbd-sharer)

Just a POC to see how a remote storage can be connected using qcow2 and
qemu-nbd, and then be consumed by qemu.

Gist: https://gist.github.com/fabiand/e68011d2157cb3cde0116b41d1b4c463

Idea:

1. An empty qcow2 is pointing to the remote storage as a backing store (can be
   any remote storage known by qemu)
2. qemu-nbd serves the qcow2 file, which is in reality then serving the backing
   store storage

Goal:

1. Privileged container to retrieve PV details and connect to storage
2. Shared directory with (next line)
3. Unprivileged container which wants to access the remote storage
