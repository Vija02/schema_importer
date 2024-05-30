#!/bin/bash -e
git clone https://github.com/outline/outline repo

cd repo
git pull

if [ -f yarn.lock ]; then
  yarn
else
  npm install
fi

DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres yarn db:migrate