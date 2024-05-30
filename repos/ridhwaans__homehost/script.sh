#!/bin/bash -e
git clone https://github.com/ridhwaans/homehost repo
cd repo
git pull

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=packages/server/prisma

find $MIGRATION_FOLDER -iname "*.sql" | sort | while read file; do
  sqlite3 $DATABASE_URL < $file
done