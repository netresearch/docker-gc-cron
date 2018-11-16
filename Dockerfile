FROM alpine:3.5

ENV DOCKER_CHANNEL=stable \
    DOCKER_ARCH=x86_64 \
    DOCKER_VERSION=18.03.0-ce

RUN apk --update add bash curl tzdata \
  && cd /tmp/ \
  && curl -fL -o docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/${DOCKER_ARCH}/docker-${DOCKER_VERSION}.tgz" \
  && tar --extract \
     --file docker.tgz \
     --strip-components 1 \
     --directory /usr/local/bin/ \
  && chmod +x /usr/local/bin/docker \
  && apk del curl \
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/*

COPY setup/ /

RUN chmod 0755 /generate-crontab.sh \
  && chmod 0755 /executed-by-cron.sh

CMD /generate-crontab.sh > /var/log/cron.log 2>&1 \
  && crontab crontab.tmp \
  && /usr/sbin/crond \
  && tail -f /var/log/cron.log
