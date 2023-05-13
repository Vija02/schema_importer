#!/bin/bash
set -e

apk add yaml-dev

git clone https://github.com/mirego/accent repo
cd repo

make dependencies
DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup

cd ..
cp /helpers/schema.prisma ./
prisma db pull

cat schema.prisma 1>&3
