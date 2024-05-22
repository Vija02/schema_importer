#!/bin/bash -e
git clone --recursive https://github.com/skillrecordings/products repo
cd repo

export MIGRATION_FOLDER=packages/database/prisma

export SCHEMA_FOLDER=packages/database/prisma
mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  mariadb -uroot -ppassword db < $file
done