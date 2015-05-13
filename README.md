# DNS relay

[dnrd](http://dnrd.sourceforge.net/) is a good enough proxying name server,
until you need AAAA record support.  

This image is a Bind9 replacement for that use-case. It's built on Alpine Linux
so it's still relatively small.

To run:

    docker run -d -p 53:53/udp -p 53:53/tcp uqeresearch/dnsrelay 8.8.8.8
