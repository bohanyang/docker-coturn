FROM alpine:3.10

ARG PACKAGE_VERSION="=4.5.1.1-r0"

RUN apk add --no-cache "coturn$PACKAGE_VERSION"

ENV TURN_PORT=3478
ENV TURN_SECRET="6737cf81c24000de51a8f5862b49bfba94d1be435fc00863f04f1cf35e76536a"
ENV TURN_REALM="example.com"

COPY turnserver.conf /etc/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["turnserver"]
