#!/bin/bash -e
git clone https://github.com/ayrat555/treasure_hunter repo
cd repo

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

curl https://sh.rustup.rs -sSf | bash -s -- -y
source "$HOME/.cargo/env"

sed -i -e "s/treasure_hunter/postgres/g" config/dev.exs
sed -i -e "s/\"treasure_hunter\"/\"postgres\"/g" config/config.exs

mix deps.get --force
mix ecto.create
mix ecto.migrate