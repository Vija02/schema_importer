#!/bin/bash -e
set -x
git clone --recursive https://github.com/lachlanjc/predictcovid repo
cd repo
git pull

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=api/prisma

cd api/prisma
prisma format
cd ../..

export SCHEMA_FOLDER=api/prisma
mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

mariadb -uroot -ppassword db < $SCHEMA_FOLDER/migrations/0_init/migration.sql