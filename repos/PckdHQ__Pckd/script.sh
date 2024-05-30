#!/bin/bash -e
git clone --recursive https://github.com/PckdHQ/Pckd repo
cd repo
git pull

export MIGRATION_FOLDER=server/prisma

export SCHEMA_FOLDER=server/prisma
mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  mariadb -uroot -ppassword db < $file
done