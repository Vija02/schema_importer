#!/bin/bash -e
git clone https://github.com/runhyve/webapp repo
cd repo
git pull

export POSTGRES_DB=postgres 
export POSTGRES_USER=postgres 
export POSTGRES_HOST=localhost 
export DATABASE_PORT=5432 
export POSTGRES_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

mix deps.get --force
mix ecto.setup