# Update Wordpress:php7.2-fpm Software repository
FROM wordpress:php7.2-fpm-alpine
# Update Alpine Software
RUN apk add --update --no-cache --virtual .build-deps \
    autoconf \
    make \
    g++ \
&& pecl install redis && docker-php-ext-enable redis \
&& apk del .build-deps