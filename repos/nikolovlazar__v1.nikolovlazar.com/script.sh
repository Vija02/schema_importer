#!/bin/bash -e
git clone --recursive https://github.com/nikolovlazar/v1.nikolovlazar.com repo
cd repo
git pull

export MIGRATION_FOLDER=prisma/migrations

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  mariadb -uroot -ppassword db < $file
done