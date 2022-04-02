FROM alpine:edge

RUN apk add --no-cache \
    bash gawk cyrus-sasl cyrus-sasl-login cyrus-sasl-crammd5 mailx \
    postfix

EXPOSE 25

CMD ["/usr/sbin/postfix", "-c", "/etc/postfix", "start-fg"]
