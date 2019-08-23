FROM httpd:2.4
COPY ./site.conf.httpd conf/extra/www.conf

ARG HOST
ARG HTTPD_LOG_LEVEL
ARG TIMEZONE

RUN sed -i "s/#LoadModule proxy_module modules\/mod_proxy.so/LoadModule proxy_module modules\/mod_proxy.so/" conf/httpd.conf && \
    sed -i "s/#LoadModule proxy_fcgi_module modules\/mod_proxy_fcgi.so/LoadModule proxy_fcgi_module modules\/mod_proxy_fcgi.so/" conf/httpd.conf && \
    sed -i "s/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/" conf/httpd.conf && \
    sed -i "s/#LoadModule auth_digest_module modules\/mod_auth_digest.so/LoadModule auth_digest_module modules\/mod_auth_digest.so/" conf/httpd.conf && \
    sed -i "s/User daemon/User www-data/" conf/httpd.conf && \
    sed -i "s/Group daemon/Group www-data/" conf/httpd.conf && \
    sed -i "s/#ServerName.*/&\nServerName $HOST:80/g" conf/httpd.conf && \
    if [ "$HTTPD_LOG_LEVEL" != "" ]; then sed -i "s/LogLevel.*/LogLevel $HTTPD_LOG_LEVEL/g" conf/extra/www.conf; fi && \
    echo "Include conf/extra/www.conf" >> conf/httpd.conf

USER root
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

ARG HOST_UID
ARG HOST_GID

RUN mkdir -p /var/www
WORKDIR /var/www

RUN groupadd -o -g ${HOST_GID} docker
RUN usermod -u ${HOST_UID} -g ${HOST_GID} www-data
RUN chown ${HOST_UID}:${HOST_GID} -R /var/www/
