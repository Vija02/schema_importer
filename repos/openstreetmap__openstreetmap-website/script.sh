#!/bin/bash -e
git clone --recursive https://github.com/openstreetmap/openstreetmap-website repo
cd repo
git pull

export DATABASE_URL=postgresql://postgres:password@localhost/postgres

psql $DATABASE_URL -f db/structure.sql -v ON_ERROR_STOP=1