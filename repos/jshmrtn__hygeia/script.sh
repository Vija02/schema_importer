#!/bin/bash -e
git clone https://github.com/jshmrtn/hygeia repo
cd repo

export SECRET_KEY_BASE=d 
export WEB_IAM_CLIENT_ID=d 
export WEB_IAM_CLIENT_SECRET=d 
export IAM_SERVICE_ACCOUNT_USER_SYNC_LOGIN=d 
export SEDEX_SENDER_ID=d 
export IAM_ORGANISATION_ID=d 
export IAM_PROJECT_ID=d 

mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
