#!/bin/bash -e
git clone --recursive https://github.com/umami-software/umami repo
cd repo

export MIGRATION_FOLDER=db/mysql/migrations

find $MIGRATION_FOLDER -iname "*.sql" ! -iname "down.sql" | sort | while read file; do
  mariadb -uroot -ppassword db < $file
done