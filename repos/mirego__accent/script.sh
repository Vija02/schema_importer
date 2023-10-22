#!/bin/bash -e
apt-get install libyaml-dev

git clone https://github.com/mirego/accent repo
cd repo

mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
