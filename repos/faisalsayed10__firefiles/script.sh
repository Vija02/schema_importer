#!/bin/bash -e
git clone --recursive https://github.com/faisalsayed10/firefiles repo
cd repo

export MIGRATION_FOLDER=apps/web/prisma/migrations

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  mariadb -uroot -ppassword db < $file
done