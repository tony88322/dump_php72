FROM php:7.2.24-fpm-alpine

COPY ./extensions /tmp/extensions
WORKDIR /tmp/extensions

ENV EXTENSIONS=",pdo_mysql,opcache,redis,qii,mysqli,gd,imagick,redis,memcached,pcntl,gettext,sockets,zip,xdebug,"
ENV MC="-j$(nproc)"

RUN export MC="-j$(nproc)" \
    && chmod +x install_tzdata.sh \
    && chmod +x install.sh \
    && chmod +x "php72.sh" \
    && sh install.sh \
    && sh install_tzdata.sh \
    && sh "php72.sh" \
    && rm -rf /tmp/extensions

WORKDIR /var/www/html