#!/bin/bash -e
git clone https://github.com/coderdojobraga/bokken repo
cd repo
git pull

export DB_NAME=postgres 
export DB_USERNAME=postgres 
export DB_HOST=localhost 
export DB_PORT=5432 
export DB_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export FRONTEND_URL=d
export PORT=7070
export SECRET_KEY_GUARDIAN=d
export HOST_URL=d

mix deps.get --force
mix ecto.setup