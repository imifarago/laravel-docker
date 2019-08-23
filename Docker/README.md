# Requirements
## Clone my traefik repository
https://github.com/imifarago/traefik-docker
Add the `traefik` network interface

## Copy .env.example to .env and fill / modify the variables
Inside this `Docker` directory

# Start the environment

You need to be set the `DOCKER_HOST_IP` environmental variable, easies way for it for example:
Add this line into your `.bashrc` file
> `export DOCKER_HOST_IP=$(/sbin/ip route|awk '/docker0/ { print $9 }')`

## Build with ./build.sh

## Start with ./start.sh

## Stop with ./stop.sh

# Accessing the site
Add the HOST value from the .env into your `hosts` file (Linux /etc/hosts)
In you browser you should reach it now, if the Laravel's .env is correct

# Future plans

## I want to add a php-cli container for cron jobs (laravel queue)

## Do you need anything into this? Add an issue :)
