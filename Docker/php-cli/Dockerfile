FROM php:7.3-cli

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /usr/share/man/man1

RUN apt-get update \
    && apt-get install -y \
      curl \
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
    docker-php-ext-configure pdo_mysql --with-pdo-mysql \
    && docker-php-ext-install intl iconv pdo_mysql mysqli mbstring zip soap gd 

RUN rm -rf /var/lib/apt/lists/*

USER root
ARG TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#RUN pecl install redis-3.1.0 \
#    && pecl install xdebug-2.5.0 \
#    && docker-php-ext-enable redis xdebug

ARG HOST_UID
ARG HOST_GID

RUN mkdir -p /var/www

VOLUME ["/var/www"]
WORKDIR /var/www
RUN groupadd -o -g ${HOST_GID} docker
RUN usermod -u ${HOST_UID} -g ${HOST_GID} www-data

# COPY docker-entrypoint.sh /entrypoint.sh
# RUN chmod a+x /entrypoint.sh && chown www-data:docker /entrypoint.sh

USER www-data

# ENTRYPOINT ["/entrypoint.sh"]
