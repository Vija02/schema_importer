#!/bin/bash -e
git clone --recursive https://github.com/Clansty/Q2TG repo
cd repo

export DATABASE_URL=postgresql://postgres:password@localhost/postgres
export MIGRATION_FOLDER=main/prisma

export SCHEMA_FOLDER=main/prisma
mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | xargs printf -- '-f %s\n' | xargs psql $DATABASE_URL -v ON_ERROR_STOP=1