#!/bin/bash -e
git clone https://github.com/notesclub/notesclub repo
cd repo

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

sed -i -e "s/ssl/#ssl/g" config/runtime.exs
sed -i -e "s/socket_options/#socket_options/g" config/runtime.exs
sed -i -e "s/\"10\"),/\"10\")/g" config/runtime.exs

mix deps.get --force
mix ecto.setup