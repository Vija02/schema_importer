#!/bin/bash -e
git clone https://github.com/system76/warehouse repo
cd repo

export DB_NAME=postgres 
export DB_USER=postgres 
export DB_HOST=localhost 
export DB_PORT=5432 
export DB_PASSWORD=postgres 
export DB_URL=postgresql://postgres:password@localhost/postgres 

# export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

cat <<EOT > config/dev.exs
import Config

config :warehouse,
  producer: {Broadway.DummyProducer, []}

config :warehouse, Warehouse.Repo,
  username: "root",
  password: "password",
  database: "db",
  hostname: "localhost",
  pool_size: 10
EOT


mix deps.get --force
mix ecto.setup