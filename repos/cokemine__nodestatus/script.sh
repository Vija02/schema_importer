#!/bin/bash -e
git clone --recursive https://github.com/cokemine/nodestatus repo
cd repo

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=packages/nodestatus-server/prisma

export SCHEMA_FOLDER=packages/nodestatus-server/prisma
mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  sqlite3 $DATABASE_URL < $file
done