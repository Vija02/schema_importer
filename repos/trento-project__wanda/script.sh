#!/bin/bash -e
git clone https://github.com/trento-project/wanda repo
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
export AMQP_URL=d
export CORS_ENABLED=false
export JWT_AUTHENTICATION_ENABLED=false

mix deps.get --force
mix ecto.setup