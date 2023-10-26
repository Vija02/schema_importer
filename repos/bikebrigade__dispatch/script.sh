#!/bin/bash -e
git clone https://github.com/bikebrigade/dispatch repo

cd repo

cp .env.local.sample .env.local

# Update the database name
# The other isn't using the env but they're already correct
sed -i -e "s/bike_brigade_dev/postgres/g" config/dev.exs

mix deps.update hackney ecto
mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
