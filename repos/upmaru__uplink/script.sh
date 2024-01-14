#!/bin/bash -e
git clone https://github.com/upmaru/uplink repo
cd repo

export UPLINK_DB_NAME=postgres 
export UPLINK_DB_USERNAME=postgres 
export UPLINK_DB_HOST=localhost 
export DATABASE_PORT=5432 
export UPLINK_DB_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

mix deps.get --force
mix ecto.setup