#!/bin/bash -e
git clone https://github.com/okkdev/cardian repo
cd repo
git pull

export DATABASE_PATH=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export CARDIAN_TOKEN=d
export SENTRY_URL=d

cat <<EOT > config/runtime.exs
import Config

config :nostrum,
  token: System.fetch_env!("CARDIAN_TOKEN"),
  gateway_intents: [
    :guilds
  ]

config :cardian,
  update_interval: String.to_integer(System.get_env("CARDIAN_UPDATE_INTERVAL", "120")),
  bonk_url: System.get_env("BONK_URL", "http://localhost:3000/order/list?auth=test-token")

config :cardian, Cardian.Repo,
  database: "../database.db",
  migration_primary_key: [name: :id, type: :binary_id]

config :sentry,
  dsn: System.fetch_env!("SENTRY_URL"),
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  included_environments: [:prod],
  environment_name: config_env()

if config_env() == :prod do
  config :logger,
    level: :info

end
EOT

mix deps.get --force
mix ecto.create
mix ecto.migrate