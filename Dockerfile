FROM ruby:2.7.2-alpine3.12

LABEL maintainer="Zol <hello@zol.fr>"

RUN set -xe \
    && apk add --no-cache libstdc++ sqlite-libs \
    && apk add --no-cache --virtual .build-deps build-base sqlite-dev \
    && gem install mailcatcher -v 0.7.1 -N \
    && apk del .build-deps

EXPOSE 1080 1025

ENTRYPOINT ["mailcatcher", "--no-quit", "--smtp-ip=0.0.0.0", "--http-ip=0.0.0.0", "--foreground"]

