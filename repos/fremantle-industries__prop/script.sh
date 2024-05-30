#!/bin/bash -e
git clone https://github.com/fremantle-industries/prop repo
cd repo
git pull

curl https://sh.rustup.rs -sSf | bash -s -- -y
source "$HOME/.cargo/env"

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

mix deps.get --force
mix deps.update ecto_sql ex_keccak
mix ecto.setup
