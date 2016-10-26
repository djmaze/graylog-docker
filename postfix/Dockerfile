FROM alpine:3.4

RUN apk add --update postfix python ca-certificates bash
COPY docker-entrypoint.sh /
COPY syslog-stdout.py /usr/local/bin/

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 25/tcp
