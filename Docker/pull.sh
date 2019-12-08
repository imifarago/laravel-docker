#!/bin/bash

set -a
[ -f .env ] && . .env
set +a

if [ -z $PROJECT_SLUG ]; then
  echo ".env PROJECT_SLUG is empty!"
  exit 1;
fi

docker-compose -p $PROJECT_SLUG build --pull