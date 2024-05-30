ARG ALPINEVER
FROM alpine:${ALPINEVER}

RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
    tzdata \
    iptables \
    wireguard-tools && \
  echo "**** cleanup ****" && \
  rm -rf /tmp/*

COPY configs/* /etc/wireguard/
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

