#!/bin/bash -e
git clone https://github.com/hashrocket/tilex repo
cd repo
git pull

export DATABASE_URL=postgresql://postgres:password@localhost/postgres
export MIGRATION_FOLDER=priv/repo

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | xargs printf -- '-f %s\n' | xargs psql $DATABASE_URL -v ON_ERROR_STOP=1