#!/bin/bash -e
git clone --recursive https://github.com/dendronhq/dendron repo
cd repo

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=packages/engine-server/prisma/migrations

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  sqlite3 $DATABASE_URL < $file
done