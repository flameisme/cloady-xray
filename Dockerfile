FROM ghcr.io/xtls/xray-core:latest AS builder
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /usr/local/bin/xray /usr/local/bin/xray
COPY config.json /etc/xray/config.json
EXPOSE 3000
CMD ["/usr/local/bin/xray", "run", "-c", "/etc/xray/config.json"]
