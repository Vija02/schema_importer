#!/bin/bash -e
git clone --recursive https://github.com/djyde/cusdis repo
cd repo

export DATABASE_URL=postgresql://postgres:password@localhost/postgres
export MIGRATION_FOLDER=prisma/pgsql/migrations

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | xargs printf -- '-f %s\n' | xargs psql $DATABASE_URL -v ON_ERROR_STOP=1