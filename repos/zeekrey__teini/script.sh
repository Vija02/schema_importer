#!/bin/bash -e
git clone --recursive https://github.com/zeekrey/teini repo
cd repo
git pull

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=prisma/migrations

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  sqlite3 $DATABASE_URL < $file
done