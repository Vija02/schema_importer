#!/bin/bash -e
apt-get install -y cmake

git clone https://github.com/framasoft/mobilizon repo

cd repo

mix deps.get --force
# Custom env
MOBILIZON_DATABASE_DBNAME=postgres MOBILIZON_DATABASE_USERNAME=postgres MOBILIZON_DATABASE_HOST=localhost MOBILIZON_DATABASE_PORT=5432 MOBILIZON_DATABASE_PASSWORD=postgres mix ecto.setup
