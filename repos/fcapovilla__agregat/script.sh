#!/bin/bash -e
git clone https://github.com/fcapovilla/agregat repo
cd repo
git pull

export MIX_ENV=prod
export SECRET_KEY_BASE=d

mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
