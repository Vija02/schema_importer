#!/bin/sh
exec 3>&1 4>&2
exec 1>/tmp/stdout.log
exec 2>/tmp/stderr.log

su -c initdb postgres 
su -c postgres postgres &

git clone https://github.com/Vija02/schema_importer importer
cd importer

wait-until "psql -U postgres -c 'select 1'"

cd "repos/$REPO_NAME"
bash script.sh
