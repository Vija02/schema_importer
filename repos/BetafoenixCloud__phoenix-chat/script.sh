#!/bin/bash -e
git clone https://github.com/BetafoenixCloud/phoenix-chat repo
cd repo

sed -i -e "s/ssl: true/# ssl: true/g" config/prod.exs
sed -i -e "s/ \"10\"),/ \"10\")/g" config/prod.exs

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

mix deps.get --force
mix ecto.setup