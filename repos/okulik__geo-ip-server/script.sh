#!/bin/bash -e
git clone --recursive https://github.com/okulik/geo-ip-server repo
cd repo

export DATABASE_NAME=postgres 
export DB_NAME=postgres 
export DATABASE_USER=postgres 
export DB_USER=postgres 
export DATABASE_HOST=localhost 
export DB_HOST=localhost 
export DATABASE_PORT=5432 
export DB_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DB_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 
export DB_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod

export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export FLY_APP_NAME=d
export API_BASIC_AUTH_USERNAME=d
export API_BASIC_AUTH_PASSWORD=d
export ADMIN_BASIC_AUTH_USERNAME=d
export ADMIN_BASIC_AUTH_PASSWORD=d
export GEOLITE2_CITY_LICENSE_KEY=d

mix deps.get --force
mix deps.update ecto_sql
mix ecto.create && mix ecto.migrate