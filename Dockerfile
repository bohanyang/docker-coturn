FROM alpine:3.10

ARG PACKAGE_VERSION="=4.5.1.1-r0"

RUN apk add --no-cache "coturn$PACKAGE_VERSION"

ENV COTURN_SECRET="6737cf81c24000de51a8f5862b49bfba94d1be435fc00863f04f1cf35e76536a"
ENV COTURN_REALM="example.com"

EXPOSE 3478
CMD ["turnserver", "--fingerprint", "--use-auth-secret", "--static-auth-secret", "$COTURN_SECRET", "--realm", "$COTURN_REALM", "--total-quota", "100", "--bps-capacity", "0", "--stale-nonce", "--no-multicast-peers"]
