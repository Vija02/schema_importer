#!/bin/bash
set -x

error_handler() {
  exit_code=$?
  echo "Error: Command exited with status $exit_code"
  exit $exit_code
}
trap 'error_handler' ERR

mariadbd --user=root &

if [ ! -d importer ]; then
  git clone --depth=1 https://github.com/Vija02/schema_importer importer
fi

wait-until "mariadb-admin ping"
mariadb-admin password password
mariadb -uroot -ppassword -e 'create database db;'

cd "/importer/repos/$REPO_NAME"
# This should run the migration
bash script.sh

# Then we can pull it into prisma
cd "/importer/repos/$REPO_NAME"
cp /helpers/schema.prisma ./

prisma db pull

if test -f "postprisma.sh"; then
  bash postprisma.sh
fi

cd "/importer/repos/$REPO_NAME"
# Dump DB
mariadb-dump -uroot -ppassword --no-data --routines --single-transaction db > db_dump.sql

echo "Sending data to $SERVER_URL/api/schema/prisma"
curl -H "Content-Type: multipart/form-data" -F "token=$TOKEN" -F "file=@schema.prisma" -F "db_dump=@db_dump.sql" -F "repo_name=$REPO_NAME" $SERVER_URL/api/schema/prisma

pkill mariadbd