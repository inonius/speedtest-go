FROM golang:1.18-alpine AS build_base
RUN apk add --no-cache git gcc ca-certificates libc-dev
WORKDIR /build
COPY go.mod go.sum ./
RUN go mod download
COPY ./ ./
RUN go build -ldflags "-w -s" -trimpath -o speedtest .

FROM alpine:3.16
RUN apk add --no-cache ca-certificates libcap
WORKDIR /app
COPY --from=build_base /build/speedtest ./
COPY settings.toml ./

# for network_mode: host
RUN setcap 'cap_net_bind_service=+ep' /app/speedtest

USER nobody
EXPOSE 8989

CMD ["./speedtest"]
