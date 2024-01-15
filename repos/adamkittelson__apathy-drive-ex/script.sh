#!/bin/bash -e
git clone https://github.com/adamkittelson/apathy-drive-ex repo
cd repo

export DB_DATABASE=postgres 
export DB_USERNAME=postgres 
export DB_HOSTNAME=localhost 
export DATABASE_PORT=5432 
export DB_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

cp config/config.exs.example config/config.exs

cat <<EOT > config/prod.exs
import Config

config :apathy_drive, ApathyDriveWeb.Endpoint,
  url: [host: System.get_env("HOST")],
  http: [port: System.get_env("PORT")],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  cache_static_manifest: "priv/static/manifest.json"

config :logger,
  level: :info

config :apathy_drive, ecto_repos: [ApathyDrive.Repo]

config :apathy_drive, ApathyDrive.Repo,
  migration_timestamps: [type: :utc_datetime_usec],
  database: System.get_env("DB_DATABASE"),
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASSWORD"),
  hostname: System.get_env("DB_HOSTNAME")
EOT

mix deps.get --force
mix ecto.create
mix ecto.migrate