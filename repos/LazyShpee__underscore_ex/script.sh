#!/bin/bash -e
git clone https://github.com/LazyShpee/underscore_ex repo
cd repo
git pull

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

cat <<EOT > config/prod.exs
import Config

config :underscore_ex, UnderscoreEx.Repo,
  database: "postgres",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"

config :underscore_ex,
  andesite_pw: ~s/uber secret password/,
  andesite_host: ~s/andes.it/,
  andesite_port: ~s/80/,
  google_api_key: ~s/my key/,
  glot_api_key: ~s/some key from glot.io/

config :nostrum,
  token: "super secret token"
EOT

mix deps.get --force
mix ecto.create
mix ecto.migrate