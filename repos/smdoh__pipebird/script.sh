#!/bin/bash -e
git clone --recursive https://github.com/smdoh/pipebird repo
cd repo

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=migrations

find $MIGRATION_FOLDER -iname "*.sql" | sort | while read file; do
  sqlite3 $DATABASE_URL < $file
done