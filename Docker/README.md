# Requirements
## Clone my traefik repository
https://github.com/imifarago/traefik-docker
Add the `traefik` network interface

## Copy .env.example to .env and fill / modify the variables
Inside this `Docker` directory

# Contains

## Apache

## PHP
7.3-fpm

## MySQL
MariaDB 10.3
Hostname: database
Own volume for /var/lib/mysql

## MongoDB
Hostname: mongo
Own volume for /var/lib/mongodb

## PhpMyAdmin

## Memcached
Hostname: cache

## Redis
Hostname: redis
Own volume

# Start the environment

You need to be set the `DOCKER_HOST_IP` environmental variable, easies way for it for example:
Add this line into your `.bashrc` file
> `export DOCKER_HOST_IP=$(/sbin/ip route|awk '/docker0/ { print $9 }')`

## Build with ./build.sh
Builds the images

## Start with ./start.sh
Starts the containers

## Stop with ./stop.sh
Stops the containers

## Pull with ./pull.sh
Downloads the latest images and build the containers

## Purge with ./purge.sh
Stop containers and purge the volumes

# Accessing the site
Add the HOST value from the .env into your `hosts` file (Linux /etc/hosts)
In you browser you should reach it now, if the Laravel's .env is correct

## PhpMyAdmin
Use the http://pma.<hostname> to reach the phpmyadmin interface

# Future plans

## I want to add a php-cli container for cron jobs (laravel queue)

## Do you need anything into this? Add an issue :)
