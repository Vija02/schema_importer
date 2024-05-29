#!/bin/bash -e
git clone --recursive https://github.com/nextauthjs/next-auth repo
cd repo

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=apps/dev/nextjs/prisma

export SCHEMA_FOLDER=apps/dev/nextjs/prisma
mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

sqlite3 $DATABASE_URL < $SCHEMA_FOLDER/migrations/0_init/migration.sql
