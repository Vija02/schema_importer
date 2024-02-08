#!/bin/bash -e
git clone https://github.com/system76/assembly repo
cd repo

export DB_NAME=postgres 
export DB_USER=postgres 
export DB_HOST=localhost 
export DB_PORT=5432 
export DB_PASS=postgres 
export DB_URL=postgresql://postgres:password@localhost/postgres 

# export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

sed -i -e "s/3.5/3.11.1/g" mix.exs
sed -i -e "s/0.15.7/0.17/g" mix.exs
sed -i -e "s/cd3.11.15c3317b100678bbf16027505e22403996c1/elixir/g" mix.exs
sed -i -e "s/assembly_dev/postgres/g" config/dev.exs

mix deps.get --force
mix deps.update ecto ecto_sql
mix ecto.setup