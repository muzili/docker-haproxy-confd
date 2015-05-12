FROM muzili/centos-base:latest

MAINTAINER Joshua Lee <muzili@gmail.com>

ENV ETCD_NODE 172.17.42.1:4001
ENV confd_ver 0.9.0

ENTRYPOINT ["/entrypoint.sh"]

RUN yum install -y haproxy

RUN wget --progress=bar:force --retry-connrefused -t 5 http://github.com/kelseyhightower/confd/releases/download/v${confd_ver}/confd-${confd_ver}-linux-amd64 -O /bin/confd && \
    chmod +x /bin/confd

ADD entrypoint.sh /entrypoint.sh
ADD confd /etc/confd

# Expose ports.
EXPOSE 8080
