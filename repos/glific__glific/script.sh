#!/bin/bash -e
git clone https://github.com/glific/glific repo
cd repo

psql postgresql://postgres:password@localhost/postgres -f priv/repo/structure.sql

sed -i -e "s/languages_label_locale_index\"/languages_label_locale_index\", name: \"custom_name\"/g" ../schema.prisma
