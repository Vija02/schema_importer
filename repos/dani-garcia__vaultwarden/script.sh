#!/bin/bash -e
git clone --recursive https://github.com/dani-garcia/vaultwarden repo
cd repo

export DATABASE_URL=postgresql://postgres:password@localhost/postgres
export MIGRATION_FOLDER=migrations/postgresql

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort -V | xargs printf -- '-f %s\n' | xargs psql $DATABASE_URL -v ON_ERROR_STOP=1