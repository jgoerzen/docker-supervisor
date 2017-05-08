FROM debian:jessie
MAINTAINER John Goerzen <jgoerzen@complete.org>
# VNC doesn't start without xfonts-base
RUN apt-get update && \
    apt-get -y -u dist-upgrade && \
    apt-get -y --no-install-recommends install supervisor && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY supervisor/ /etc/supervisor/conf.d/

EXPOSE 5901
CMD ["/usr/local/bin/boot-supervisord"]

