#!/bin/sh

rm /etc/bind/*

cat <<CONF > /etc/bind/named.conf
options {
  directory "/var/bind";
  forwarders {
CONF

for i in $@
do
  echo "    $i;" >> /etc/bind/named.conf
done

cat <<CONF >> /etc/bind/named.conf
  };

  listen-on port 53 { any; };
  allow-query { any; };
  allow-recursion { any; };
  allow-transfer { none; };

  auth-nxdomain no;    # conform to RFC1035
  listen-on-v6 { any; };
};
CONF

echo "### Starting with config:"
cat /etc/bind/named.conf
echo "###"

exec /usr/sbin/named -g
