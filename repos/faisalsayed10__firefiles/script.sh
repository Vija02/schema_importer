#!/bin/bash -e
git clone --recursive https://github.com/faisalsayed10/firefiles repo
cd repo

export SCHEMA_FOLDER=apps/web/prisma
mkdir -p $SCHEMA_FOLDER/migrations/0_init
prisma migrate diff \
--from-empty \
--to-schema-datamodel $SCHEMA_FOLDER/schema.prisma \
--script > $SCHEMA_FOLDER/migrations/0_init/migration.sql

mariadb -uroot -ppassword db < $SCHEMA_FOLDER/migrations/0_init/migration.sql