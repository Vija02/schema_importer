#!/bin/bash -e
su postgres -c 'pg_ctl initdb'
su postgres -c 'pg_ctl -D /var/lib/postgresql/data start'

if [ ! -d importer ]; then
  git clone --depth=1 https://github.com/Vija02/schema_importer importer
fi
cd importer

wait-until "psql -U postgres -c 'select 1'"

cd "repos/$REPO_NAME"
# This should run the migration
bash script.sh

# Then we can pull it into prisma
cd "repos/$REPO_NAME"
cp /helpers/schema.prisma ./
prisma db pull

echo "Sending data to $SERVER_URL/api/schema/prisma"
curl -H "Content-Type: multipart/form-data" -F "token=$TOKEN" -F "file=@schema.prisma" -F "repo_name=$REPO_NAME" $SERVER_URL/api/schema/prisma

su postgres -c 'pg_ctl -D /var/lib/postgresql/data stop'