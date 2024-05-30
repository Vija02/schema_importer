#!/bin/bash -e
git clone --recursive https://github.com/alfio-event/alf.io repo
cd repo
git pull

export DATABASE_URL=postgresql://postgres:password@localhost/postgres
export MIGRATION_FOLDER=src/main/resources/alfio/db/PGSQL

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort -V --field-separator=_ --key=1,2 | xargs printf -- '-f %s\n' | xargs psql $DATABASE_URL -v ON_ERROR_STOP=1