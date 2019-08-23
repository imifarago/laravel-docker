# redis-memcached
# official, de nem lehet benne memory limitet állítani (egyszerűen), meg egy csomó mindent nem!
FROM memcached:1.5

USER root
ENV TZ=Europe/Budapest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y netcat

COPY ./clear-cache.sh /
RUN chmod 755 /clear-cache.sh

USER memcache