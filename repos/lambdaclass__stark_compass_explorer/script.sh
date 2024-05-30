#!/bin/bash -e
git clone https://github.com/lambdaclass/stark_compass_explorer repo
cd repo
git pull

export DATABASE_PATH=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export RPC_API_HOST=d
export TESTNET_RPC_API_HOST=d
export SEPOLIA_RPC_API_HOST=d
export DB_TYPE=sqlite

mix deps.get --force
mix ecto.setup