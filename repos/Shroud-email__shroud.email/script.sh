#!/bin/bash -e
git clone https://github.com/Shroud-email/shroud.email repo
cd repo

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export DB_ENCRYPTION_KEY=VGVzdA==
export SMTP_USERNAME=d
export SMTP_PASSWORD=d
export EMAIL_DOMAIN=d
export APP_DOMAIN=d

mix deps.get --force
mix ecto.setup