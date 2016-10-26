#!/usr/bin/env bash
set -euo pipefail

main() {
  local network_address="$(route | tail -n1 | awk '{print $1}')/16"
  echo "network address: $network_address"

  cat <<EOF >> /etc/postfix/main.cf
myhostname = $MYHOSTNAME
mynetworks = $network_address
smtputf8_enable = no

smtp_use_tls = yes
smtp_tls_security_level = verify
smtp_tls_mandatory_ciphers = high
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
EOF

  /usr/local/bin/syslog-stdout.py &
  exec /usr/lib/postfix/master -d
}

main "$@"
