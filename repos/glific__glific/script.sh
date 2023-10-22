#!/bin/bash -e
git clone https://github.com/glific/glific repo
cd repo

MIX_ENV=prod mix deps.get --force
MIX_ENV=prod DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
