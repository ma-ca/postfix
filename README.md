# Postfix Docker image

Postfix stable release 3.7.0

http://www.postfix.org/announcements.html


```
docker run postfix postconf mail_version | sed 's/mail_version = //'
```

Dockerfile
```
FROM alpine:edge

RUN apk add --no-cache \
    bash gawk cyrus-sasl cyrus-sasl-login cyrus-sasl-crammd5 mailx \
    postfix

EXPOSE 25
```

build multiarch images on Ubuntu with buildx and qemu-user-static

https://github.com/multiarch/qemu-user-static

```
docker run --rm --privileged multiarch/qemu-user-static:register
docker buildx build --platform linux/arm64 -t postfix .
```

```
docker run --rm postfix uname -m
aarch64
```

```
docker run --rm postfix postconf mail_version
mail_version = 3.7.0
```
