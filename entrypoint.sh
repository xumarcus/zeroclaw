#!/bin/sh
# Fix volume ownership before dropping privileges.
# Required when named volumes are seeded by a container running as root
# (e.g. `docker compose run zeroclaw onboard` from a different image).
/bin/busybox chown -R 65534:65534 /zeroclaw-data
exec /bin/busybox setuidgid 65534:65534 /usr/local/bin/zeroclaw "$@"
