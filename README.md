<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/198/fire-engine_1f692.png" width="120px"></p>
<h1 align="center">pushgateway (container image)</h1>
<p align="center">Built-from-source container image of Prometheus' <a href="https://github.com/prometheus/pushgateway">pushgateway</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/pushgateway`](https://hub.docker.com/r/ricardbejarano/pushgateway):

- [`1.3.1-glibc`, `1.3.1`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.glibc) (about `14.7MB`)
- [`1.3.1-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.musl) (about `16.5MB`)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/pushgateway`](https://quay.io/repository/ricardbejarano/pushgateway), [`quay.io/ricardbejarano/pushgateway-glibc`](https://quay.io/repository/ricardbejarano/pushgateway-glibc), tags: [`1.3.1`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.glibc) (about `16.5MB`)
- [`quay.io/ricardbejarano/pushgateway-musl`](https://quay.io/repository/ricardbejarano/pushgateway-musl), tags: [`1.3.1`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/pushgateway/blob/master/Dockerfile.musl) (about `16.5MB`)


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
