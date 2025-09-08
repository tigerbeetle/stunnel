#!/bin/sh
set -eu

cat > /etc/stunnel/stunnel.conf <<EOF
foreground = yes

[tigerbeetle client]
client     = yes
accept     = ${stunnel_listen}
connect    = ${stunnel_endpoint}
debug      = 5
PSKsecrets = /etc/stunnel/psk.txt
EOF

cat > /etc/stunnel/psk.txt <<EOF
${stunnel_psk}
EOF

exec stunnel /etc/stunnel/stunnel.conf
