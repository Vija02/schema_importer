#!/bin/bash
set -e

apt-get install libyaml-dev

git clone https://github.com/mirego/accent repo
cd repo

mix deps.get --force
DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup

cd ..
cp /helpers/schema.prisma ./
prisma db pull

exec 1>&3 2>&4

printf "\n====OUTPUT====\n"
cat schema.prisma
