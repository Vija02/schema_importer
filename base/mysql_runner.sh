#!/bin/bash -e
mysqld &

if [ ! -d importer ]; then
  git clone --depth=1 https://github.com/Vija02/schema_importer importer
fi

wait-until "mysqladmin ping"
mysqladmin password password
mysql -uroot -ppassword -e 'create database db;'

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
mysqldump -uroot -ppassword --no-data --routines --single-transaction db > db_dump.sql

echo "Sending data to $SERVER_URL/api/schema/prisma"
curl -H "Content-Type: multipart/form-data" -F "token=$TOKEN" -F "file=@schema.prisma" -F "db_dump=@db_dump.sql" -F "repo_name=$REPO_NAME" $SERVER_URL/api/schema/prisma

pkill mysqld