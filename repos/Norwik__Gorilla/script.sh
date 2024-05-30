#!/bin/bash -e
git clone https://github.com/Norwik/Gorilla repo
cd repo
git pull

export DATABASE_NAME=postgres 
export DB_DATABASE=postgres 
export DATABASE_USER=postgres 
export DB_USERNAME=postgres 
export DATABASE_HOST=localhost 
export DB_HOSTNAME=localhost 
export DATABASE_PORT=5432 
export DB_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DB_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export APP_SECRET=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

mix deps.get --force
mix ecto.setup