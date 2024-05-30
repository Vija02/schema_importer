#!/bin/bash -e
git clone https://github.com/Bluetab/td-dd repo
cd repo
git pull

export DB_NAME=postgres 
export DB_USER=postgres 
export DB_HOST=localhost 
export DB_PORT=5432 
export DB_PASSWORD=postgres 
export DB_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export GUARDIAN_SECRET_KEY=d
export VAULT_TOKEN=d
export VAULT_SECRETS_PATH=d
export REDIS_HOST=d
export HOSTNAME=d
export ES_URL=d

mix deps.get --force
mix ecto.setup