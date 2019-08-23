# https://github.com/imifarago/laravel-docker
It's a totally clear unmodifier Laravel 5.8 with my own Docker container support in the Docker/ subfolder.
Totally independent project from the Laravel developers!

# First steps

## Read the README in the Docker/ subfolder
And don't forget to clone the traefik repository

## copy .env.example to .env and fill / add / modify variables
The host for mysql and memcached are set for the Docker environment

## Edit configs
In the Laravel's config/ subfolder

## Install composer packages
After you enter into the container with:
`docker exec -it <php-fpm-container-id> /bin/bash`
You can do in the /var/www:
`composer install` etc...

## Run Laravel database migration in the php-fpm container!
`docker exec -it <php-fpm-container-id> /bin/bash`
`php artisan migrate`
`php artisan db:seed`

# Always use `php artisan` inside the php-fpm container!
