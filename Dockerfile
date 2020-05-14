FROM golang:1.13-alpine AS build

COPY . /go/src/github.com/soar/prometheus-swarm-discovery/

WORKDIR /go/src/github.com/soar/prometheus-swarm-discovery/

RUN go build

FROM golang:1.13-alpine

COPY --from=build /go/src/github.com/soar/prometheus-swarm-discovery/prometheus-swarm-discovery /bin/

ENTRYPOINT ["prometheus-swarm-discovery", "discover"]
