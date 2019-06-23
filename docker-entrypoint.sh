#!/usr/bin/env sh

set -e

sed -i "s,{{PORT}},$TURN_PORT," /etc/turnserver.conf
sed -i "s,{{SECRET}},$TURN_SECRET," /etc/turnserver.conf
sed -i "s,{{REALM}},$TURN_REALM," /etc/turnserver.conf

exec "$@"
