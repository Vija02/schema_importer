#!/bin/bash -e
git clone https://github.com/pentacent/keila repo
cd repo
git pull

export MIX_ENV=prod
export SECRET_KEY_BASE=d
export DB_URL=postgresql://postgres:password@localhost/postgres
export MAILER_SMTP_HOST=d
export MAILER_SMTP_USER=d
export MAILER_SMTP_PASSWORD=d

mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
