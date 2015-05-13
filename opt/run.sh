#!/bin/bash

cat <<CONF > /etc/bind/named.conf.options
options {
  directory "/var/cache/bind";
  forwarders {
CONF

for i in $@
do
  echo "    $i;" >> /etc/bind/named.conf.options
done

cat <<CONF >> /etc/bind/named.conf.options
  };

  listen-on port 53 { any; };
  allow-query { any; };
  allow-recursion { any; };
  allow-transfer { none; };

  auth-nxdomain no;    # conform to RFC1035
  listen-on-v6 { any; };
};
CONF

cat /etc/bind/named.conf.options

exec /usr/sbin/named -f
