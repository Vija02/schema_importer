#!/bin/bash -e
git clone --recursive https://github.com/sheshbabu/freshlytics repo
cd repo

export DATABASE_URL=postgresql://postgres:password@localhost/postgres
export MIGRATION_FOLDER=src/server/migrations

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort -V | xargs printf -- '-f %s\n' | xargs psql $DATABASE_URL -v ON_ERROR_STOP=1