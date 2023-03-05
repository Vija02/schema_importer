#!/bin/bash
set -e

apk add yaml-dev

git clone https://github.com/mirego/accent repo
cd repo

mix deps.get
DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.migrate

cd ..
cp /helpers/schema.prisma ./
prisma db pull

cat schema.prisma 1>&3
