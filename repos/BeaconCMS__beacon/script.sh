#!/bin/bash -e
git clone https://github.com/BeaconCMS/beacon repo
cd repo

sed -i -e "s/beacon_dev/postgres/g" config/dev.exs

mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
