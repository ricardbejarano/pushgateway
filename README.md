<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/198/fire-engine_1f692.png" width="120px"></p>
<h1 align="center">pushgateway (container image)</h1>
<p align="center">Built-from-source container image of Prometheus' <a href="https://github.com/prometheus/pushgateway">pushgateway</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/pushgateway`](https://hub.docker.com/r/ricardbejarano/pushgateway):

- [`1.0.0-glibc`, `1.0.0`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.glibc) (about `14.7MB`)
- [`1.0.0-glibc-arm`, `1.0.0-arm`, `glibc-arm`, `master-arm`, `latest-arm` *(Dockerfile.glibc-arm)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.glibc-arm) (about `16.5MB`)
- [`1.0.0-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.musl) (about `16.5MB`)
- [`1.0.0-musl-arm`, `musl-arm` *(Dockerfile.musl-arm)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.musl-arm) (about `14.7MB`)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/pushgateway-glibc`](https://quay.io/repository/ricardbejarano/pushgateway-glibc), tags: [`1.0.0`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.glibc) (about `16.5MB`)
- [`quay.io/ricardbejarano/pushgateway-glibc-arm`](https://quay.io/repository/ricardbejarano/pushgateway-glibc-arm), tags: [`1.0.0`, `master`, `latest` *(Dockerfile.glibc-arm)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.glibc-arm) (about `14.7MB`)
- [`quay.io/ricardbejarano/pushgateway-musl`](https://quay.io/repository/ricardbejarano/pushgateway-musl), tags: [`1.0.0`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.musl) (about `16.5MB`)
- [`quay.io/ricardbejarano/pushgateway-musl-arm`](https://quay.io/repository/ricardbejarano/pushgateway-musl-arm), tags: [`1.0.0`, `master`, `latest` *(Dockerfile.musl-arm)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.musl-arm) (about `14.7MB`)


## Features

* Super tiny (see [Tags](#tags))
* Compiled from source during build time
* Built `FROM scratch`, with zero bloat (see [Filesystem](#filesystem))
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

- To build the `glibc`-based image: `$ docker build -t pushgateway:glibc -f Dockerfile.glibc .`
- To build the `musl`-based image: `$ docker build -t pushgateway:musl -f Dockerfile.musl .`


## Configuration

### Volumes

- Mount your **data** at `/data`.


## Filesystem

```
/
├── data/
├── etc/
│   ├── group
│   └── passwd
└── pushgateway
```


## License

See [LICENSE](https://github.com/ricardbejarano/pushgateway/blob/master/LICENSE).
