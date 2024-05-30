#!/bin/bash -e
git clone --recursive https://github.com/lagonapp/lagon repo
cd repo
git pull

export MIGRATION_FOLDER=packages/dashboard/prisma/migrations

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  mariadb -uroot -ppassword db < $file
done