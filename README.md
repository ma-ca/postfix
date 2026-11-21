# Postfix Container image

Postfix stable release 3.11.7

http://www.postfix.org/announcements.html


```
podman run --rm postfix postconf mail_version | sed 's/mail_version = //'
```

Dockerfile
```
FROM alpine:edge

RUN apk add --no-cache \
    bash gawk cyrus-sasl cyrus-sasl-login cyrus-sasl-crammd5 mailx \
    postfix

EXPOSE 25
```

build multiarch images on Ubuntu

```
sudo podman run --rm --privileged tonistiigi/binfmt --install all
podman build --platform linux/arm64 -t postfix .
```

```
podman run --rm postfix uname -m
aarch64
```

```
podman run --rm postfix postconf mail_version
mail_version = 3.11.7
```
