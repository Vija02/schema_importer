#!/bin/bash -e
git clone https://github.com/HarryET/supa-manager repo
cd repo
git pull

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export K8S_TOKEN=d
export K8S_URL=d
export JWT_SECRET=d
export ENCRYPTION_KEY=d
export HOOK_URL=d
export HOOK_SECRET=d

mix deps.get --force
mix deps.update ecto_sql
mix ecto.setup