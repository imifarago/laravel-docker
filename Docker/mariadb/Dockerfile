FROM mariadb:10.1

ENV DEBIAN_FRONTEND noninteractive

USER root
ARG TIMEZONE
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone
