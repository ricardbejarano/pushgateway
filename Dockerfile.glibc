FROM golang:1 AS build

ARG VERSION="1.0.1"
ARG CHECKSUM="9af1658f89a960c3c688b2af993217b5dc2ffad7123bb3e50eb46ceff49b39a1"

ADD https://github.com/prometheus/pushgateway/archive/v$VERSION.tar.gz /tmp/pushgateway.tar.gz

RUN [ "$CHECKSUM" = "$(sha256sum /tmp/pushgateway.tar.gz | awk '{print $1}')" ] && \
    tar -C /tmp -xf /tmp/pushgateway.tar.gz && \
    mv /tmp/pushgateway-$VERSION /tmp/pushgateway

RUN cd /tmp/pushgateway && \
      make build && \
    echo "nogroup:*:100:nobody" > /tmp/group && \
    echo "nobody:*:100:100:::" > /tmp/passwd && \
    mkdir -p /tmp/data


FROM scratch

COPY --from=build --chown=100:100 /tmp/pushgateway/pushgateway /
COPY --from=build --chown=100:100 /tmp/data /data
COPY --from=build --chown=100:100 /tmp/group \
                                  /tmp/passwd \
                                  /etc/

USER 100:100
WORKDIR /data
VOLUME ["/data"]
EXPOSE 9091/tcp
ENTRYPOINT ["/pushgateway"]
