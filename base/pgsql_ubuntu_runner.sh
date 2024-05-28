#!/bin/bash
set -x

error_handler() {
    exit_code=$?
    echo "Error: Command exited with status $exit_code"
    exit $exit_code
}
trap 'error_handler' ERR

pg_ctlcluster 16 main start

if [ ! -d importer ]; then
  git clone --depth=1 https://github.com/Vija02/schema_importer importer
fi

wait-until "psql -U postgres -c 'select 1'"

cd "/importer/repos/$REPO_NAME"
# This should run the migration
bash script.sh

# Then we can pull it into prisma
cd "/importer/repos/$REPO_NAME"
cp /helpers/schema.prisma ./

# Items that we want to exclude
declare -A map=( [pg_toast]=1 [pg_catalog]=1 [information_schema]=1 )

# Get all the schemas
allSchemasString=$(psql -U postgres -c 'select schema_name from information_schema.schemata;' | sed -n '3,${p;}' | head -n -2 | tr -d "[:blank:]")
allSchemasArray=()

while read line; do
  if ! [[ ${map["$line"]} ]] ; then
    allSchemasArray+=("\"$line\"")
  fi
done <<< "$allSchemasString"

# https://stackoverflow.com/a/9429887
processedSchemas=$(IFS=, ; echo "${allSchemasArray[*]}")

# Update schema.prisma
sed -i -e "s/SCHEMAS_REPLACE_ME/$processedSchemas/g" schema.prisma

prisma db pull

if test -f "postprisma.sh"; then
  bash postprisma.sh
fi

cd "/importer/repos/$REPO_NAME"
# Dump DB
pg_dump -U postgres -sO -f db_dump.sql postgres

echo "Sending data to $SERVER_URL/api/schema/prisma"
curl -H "Content-Type: multipart/form-data" -F "token=$TOKEN" -F "file=@schema.prisma" -F "db_dump=@db_dump.sql" -F "repo_name=$REPO_NAME" $SERVER_URL/api/schema/prisma

pg_ctlcluster 16 main stop