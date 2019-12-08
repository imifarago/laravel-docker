FROM php:7.3-fpm

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /usr/share/man/man1

RUN apt-get update \
    && apt-get install -y \
      dma \
      libmemcached-dev \
      # subversion \
      # git \
      # for php intl extension
      libicu-dev \
      # for php mcrypt extension
      libmcrypt-dev \
      # for php zip
      zlib1g-dev \
      imagemagick \
      libxml2-dev \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng-dev \
      ca-certificates \
      libzip-dev
     
RUN pecl install memcached

RUN docker-php-ext-enable memcached \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql \
    && docker-php-ext-install intl iconv pdo_mysql mysqli mbstring zip soap gd

RUN apt-get install -y \
    libssl1.1 \
    libssl-dev

RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

RUN pecl install redis \
    && docker-php-ext-enable redis

RUN rm -rf /var/lib/apt/lists/* && rm -rf /tmp/pear/*

USER root
ARG TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ARG MAIL_SMTP_SERVER
ARG MAIL_AUTH_USER
ARG MAIL_AUTH_PASS
WORKDIR /etc/dma
RUN sed -i "s/#SMARTHOST/SMARTHOST $MAIL_SMTP_SERVER/g" /etc/dma/dma.conf; \
    if [ "$MAIL_SMTP_SERVER" != "10.168.12.3" ]; then \
        sed -i "s/#AUTHPATH/AUTHPATH/g" /etc/dma/dma.conf; \
        echo "$MAIL_AUTH_USER|$MAIL_SMTP_SERVER:$MAIL_AUTH_PASS" >> /etc/dma/auth.conf; \
    fi;

WORKDIR /usr/local/etc/php-fpm.d
RUN if [ "$PHP_LOG_LEVEL" != "" ]; then sed -i "s/;log_level = .*/&\nlog_level = $PHP_LOG_LEVEL/g" www.conf; fi && \
    echo "php_value[memory_limit] = 128M" >> www.conf

ARG HOST_UID
ARG HOST_GID

RUN mkdir -p /var/www

VOLUME ["/var/www"]
WORKDIR /var/www
RUN groupadd -o -g ${HOST_GID} docker
RUN usermod -u ${HOST_UID} -g ${HOST_GID} www-data

USER www-data
