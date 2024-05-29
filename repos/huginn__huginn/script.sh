#!/bin/bash -e
set -x
git clone --recursive https://github.com/huginn/huginn repo
cd repo

cat <<EOT > .env
APP_SECRET_TOKEN=REPLACE_ME_NOW!
DOMAIN=localhost:3000
PORT=3000
FORCE_SSL=false

DATABASE_ADAPTER=postgresql
DATABASE_ENCODING=utf8
DATABASE_RECONNECT=true
DATABASE_NAME=postgres
DATABASE_POOL=20
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=postgres
DATABASE_PORT=5432
DATABASE_HOST=localhost
EOT

export DATABASE_NAME=postgres 
export DATABASE_USERNAME=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 

export RAILS_ENV=production

bundle install
bundle add bigdecimal
bundle exec rake db:migrate