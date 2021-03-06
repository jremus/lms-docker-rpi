FROM resin/rpi-raspbian:jessie
MAINTAINER Jens Remus <jens.remus@gmail.com>

ENV LMS_VERSION 7.9.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    perl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget --progress=dot:mega -O /tmp/lms.deb $(wget -q -O - "http://www.mysqueezebox.com/update/?version=$LMS_VERSION&revision=1&geturl=1&os=deb" | sed -s "s/_all.deb/_arm.deb/") \
 && dpkg -i /tmp/lms.deb \
 && rm /tmp/lms.deb

VOLUME /var/lib/squeezeboxserver /var/log/squeezeboxserver

EXPOSE 3483 3483/udp 9000 9090

USER squeezeboxserver

CMD [ "/usr/sbin/squeezeboxserver", "--user", "squeezeboxserver", "--prefsdir", "/var/lib/squeezeboxserver/prefs", "--logdir", "/var/log/squeezeboxserver/", "--cachedir", "/var/lib/squeezeboxserver/cache", "--charset=utf8" ]
