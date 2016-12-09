FROM php:alpine

MAINTAINER Instrumentisto Team <developer@instrumentisto.com>


# Install phpDocumentor executable
ADD https://github.com/phpDocumentor/phpDocumentor2/releases/download/v2.9.0/phpDocumentor.phar \
    /usr/local/bin/phpdoc

RUN chmod 755 /usr/local/bin/phpdoc \

 # Install required PHP extensions and packages
 && apk add --update --no-cache \
            graphviz \
            icu-libs libxslt \

 && apk add --no-cache --virtual .build-deps \
            icu-dev libxslt-dev \
 && docker-php-ext-install intl xsl \

 && apk del .build-deps \
 && rm -rf /var/cache/apk/*


VOLUME ["/app"]

WORKDIR /app


ENTRYPOINT ["/usr/local/bin/phpdoc"]
