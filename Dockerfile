FROM golang:1-alpine AS build

ARG VERSION="1.6.1"
ARG CHECKSUM="f2485659ff70cb0f80951cf8f138cd986be6ec866d079074bf1fda4419d04e87"

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
