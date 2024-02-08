#!/bin/bash -e
git clone https://github.com/CoThings-App/cothings repo
cd repo

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

# export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

sed -i -e "s/coliving_dev/postgres/g" config/dev.exs

mix deps.get --force
mix deps.update ecto_sql
mix ecto.setup