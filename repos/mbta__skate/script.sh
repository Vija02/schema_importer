#!/bin/bash -e
git clone https://github.com/mbta/skate repo
cd repo

sed -i -e "s/skate_dev/postgres/g" config/dev.exs

export POSTGRES_USERNAME=postgres
export POSTGRES_PASSWORD=password
export POSTGRES_HOSTNAME=localhost
# export MIX_ENV=prod
# export SECRET_KEY_BASE=L9R/nrwaipUQE0u9DlNV5guuY68Ol62dL1dPdPInEYLucufWjPPSC4E6MweUWxyw
# export SMTP_SERVER=d
# export SMTP_USERNAME=d
# export SMTP_PASSWORD=d
# export SMTP_PORT=d

mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
