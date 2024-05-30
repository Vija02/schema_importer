#!/bin/bash -e
git clone --recursive https://github.com/stackernews/stacker.news repo
cd repo

git reset --hard

apt-get update
apt-get install --no-install-recommends -y postgresql-16-ip4r

export DATABASE_URL=postgresql://postgres:password@localhost/postgres
export MIGRATION_FOLDER=prisma

export SCHEMA_FOLDER=prisma
sed -i -e "s/datasource db {/datasource db {\nextensions = [citext, ltree, pgcrypto, pg_trgm, ip4r]/g" $SCHEMA_FOLDER/schema.prisma
sed -i -e "s/generator client {/generator client {\npreviewFeatures = [\"postgresqlExtensions\"]/g" $SCHEMA_FOLDER/schema.prisma

mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

psql $DATABASE_URL -f $SCHEMA_FOLDER/migrations/0_init/migration.sql -v ON_ERROR_STOP=1