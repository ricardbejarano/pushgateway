FROM golang:1-alpine AS build

ARG VERSION="1.4.1"
ARG CHECKSUM="4a5f97ea8c14fc4366ab07a798fcf46ed65481115457998ab86e50955662fd2d"

ADD https://github.com/prometheus/pushgateway/archive/v$VERSION.tar.gz /tmp/pushgateway.tar.gz

RUN [ "$(sha256sum /tmp/pushgateway.tar.gz | awk '{print $1}')" = "$CHECKSUM" ] && \
    apk add curl make && \
    tar -C /tmp -xf /tmp/pushgateway.tar.gz && \
    mkdir -p /go/src/github.com/prometheus && \
    mv /tmp/pushgateway-$VERSION /go/src/github.com/prometheus/pushgateway && \
    cd /go/src/github.com/prometheus/pushgateway && \
      make build

RUN mkdir -p /rootfs/bin && \
      cp /go/src/github.com/prometheus/pushgateway/pushgateway /rootfs/bin/ && \
    mkdir -p /rootfs/data && \
    mkdir -p /rootfs/etc && \
      echo "nogroup:*:10000:nobody" > /rootfs/etc/group && \
      echo "nobody:*:10000:10000:::" > /rootfs/etc/passwd


FROM scratch

COPY --from=build --chown=10000:10000 /rootfs /

USER 10000:10000
WORKDIR /data
VOLUME ["/data"]
EXPOSE 9091/tcp
ENTRYPOINT ["/bin/pushgateway"]
