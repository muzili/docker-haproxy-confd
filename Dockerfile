FROM muzili/centos-base:latest
MAINTAINER Joshua Lee <muzili@gmail.com>

ENV ETCD_NODE 172.17.42.1:4001

RUN yum install -y haproxy

ADD entrypoint.sh /entrypoint.sh
ADD confd /etc/confd

# Expose ports.
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
