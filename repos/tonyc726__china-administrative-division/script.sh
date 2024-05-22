#!/bin/bash -e
git clone --recursive https://github.com/tonyc726/china-administrative-division repo
cd repo

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=.

export SCHEMA_FOLDER=.
mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  sqlite3 $DATABASE_URL < $file
done