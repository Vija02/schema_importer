#!/bin/bash -e
git clone https://github.com/wwww-wwww/grasstube repo
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

config :grasstube, Grasstube.Repo,
  username: "postgres",
  password: "postgres",
  database: "postgres",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :grasstube,
  youtube_api_keys: []

config :grasstube, GrasstubeWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 4001],
  url: [host: "tube.grass.moe"],
  cache_static_manifest: "priv/static/cache_manifest.json",
  static_url: [path: "/"],
  secret_key_base: "tZqi2wgaIRtzw+O25GserhwHSIx+57etZ8dhwxlK4UB5q8Mab7gbPZTfv4S6cRlk"

config :logger, level: :info
EOT

mix deps.get --force
mix ecto.setup
