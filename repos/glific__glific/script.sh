#!/bin/bash -e
git clone https://github.com/glific/glific repo
cd repo
git pull

psql postgresql://postgres:password@localhost/postgres -f priv/repo/structure.sql
