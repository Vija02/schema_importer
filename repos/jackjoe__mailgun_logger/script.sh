#!/bin/bash -e
git clone https://github.com/jackjoe/mailgun_logger repo
cd repo

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 
export ML_DB_USER=postgres
export ML_DB_PASSWORD=postgres
export ML_DB_NAME=postgres
export ML_DB_HOST=localhost

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export PORT=8000

mix deps.get --force
mix ecto.setup