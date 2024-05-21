#!/bin/bash -e
git clone https://github.com/spacedriveapp/spacedrive repo
cd repo

export DATABASE_URL=../database.db
export MIGRATION_FOLDER=core/prisma

find $MIGRATION_FOLDER -iname "*.sql" | sort | while read file; do
  sqlite3 $DATABASE_URL < $file
done