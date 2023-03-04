#!/bin/sh

su -c initdb postgres 
su -c postgres postgres &

wait-until "psql -U postgres -c 'select 1'"

git clone https://github.com/Vija02/schema_importer importer
cd importer

cd "repos/$REPO_NAME"
bash script.sh

echo "DONE"

