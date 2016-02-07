FROM ubuntu:trusty
MAINTAINER Doug Chapman <prjctgeek@gmail.com>
VOLUME ["/var/lib/unifi", "/var/log/unifi", "/usr/lib/unifi/work"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y --force-yes curl binutils openjdk-7-jre-headless mongodb-server jsvc supervisor && \
  apt-get clean

RUN /usr/bin/curl http://dl.ubnt.com/unifi/4.8.12/unifi_sysvinit_all.deb -o /var/tmp/unifi_sysvinit_all.deb && \
 dpkg --install /var/tmp/unifi_sysvinit_all.deb 

COPY ./hier /

EXPOSE 8080/tcp 8081/tcp 8443/tcp 8843/tcp 8880/tcp 3478/udp

WORKDIR /var/lib/unifi

CMD ["/usr/bin/supervisord","-n"]
