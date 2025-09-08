#!/bin/sh
set -eu

cat > /etc/stunnel/stunnel.conf <<EOF
foreground = yes

EOF

for i in $(seq 1 ${stunnel_count}); do
	eval "stunnel_listen=\${stunnel_listen_$i}"
	eval "stunnel_endpoint=\${stunnel_endpoint_$i}"

	cat >> /etc/stunnel/stunnel.conf <<EOF
[tigerbeetle client ${i}]
client     = yes
accept     = ${stunnel_listen}
connect    = ${stunnel_endpoint}
debug      = 5
PSKsecrets = /etc/stunnel/psk.txt

EOF
done

cat > /etc/stunnel/psk.txt <<EOF
${stunnel_psk}
EOF

exec stunnel /etc/stunnel/stunnel.conf
