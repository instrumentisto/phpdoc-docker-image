<?php
$var = getopt('', ['version:', 'dockerfile:']);
$isPhpDocV1 = (reset(explode('/', $var['dockerfile'])) === '1');
$PhpDocVer = reset(explode('-', $var['version']));
?>
# AUTOMATICALLY GENERATED
# DO NOT EDIT THIS FILE DIRECTLY, USE /Dockerfile.tmpl.php

# https://hub.docker.com/_/php
<? if ($isPhpDocV1) { ?>
FROM php:5.6-alpine
<? } else { ?>
FROM php:7.1-alpine
<? } ?>

MAINTAINER Instrumentisto Team <developer@instrumentisto.com>


# Install phpDocumentor executable
<? if ($isPhpDocV1) { ?>
RUN pear install PhpDocumentor-<?= $PhpDocVer; ?> \
                 XML_Beautifier \
 && pear clear-cache \
 && rm -rf /tmp/*
<? } else { ?>
RUN curl -fL -o /usr/local/bin/phpdoc \
         https://github.com/phpDocumentor/phpDocumentor2/releases/download/v<?= $PhpDocVer; ?>/phpDocumentor.phar \
 && chmod 755 /usr/local/bin/phpdoc
<? } ?>
<? if ($isPhpDocV1) { ?>


# Tune up php.ini
RUN echo "error_reporting = E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED & ~E_WARNING" \
        > /usr/local/etc/php/conf.d/errors.ini
<? } ?>
<? if (!$isPhpDocV1) { ?>


# Install required PHP extensions and packages
RUN apk add --update --no-cache \
            graphviz \
            icu-libs libxslt \
    \
 && apk add --no-cache --virtual .build-deps \
            icu-dev libxslt-dev \
 && docker-php-ext-install intl xsl \
    \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/*
<? } ?>


VOLUME ["/app"]

WORKDIR /app


ENTRYPOINT ["/usr/local/bin/phpdoc"]
