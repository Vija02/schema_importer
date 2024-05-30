#!/bin/bash -e
git clone https://github.com/system76/recognizer repo
cd repo
git pull

export DATABASE_NAME=db 
export DATABASE_USER=root 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=password 
export DATABASE_URL=mysql://root:password@localhost/db

export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

cat <<EOT > config/dev.exs
import Config

config :recognizer,
  hal_url: "https://api-v2.genesis76.com"

config :recognizer, Recognizer.Repo,
  username: "root",
  password: "password",
  database: "db",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :recognizer, RecognizerWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch",
      "--no-stats-all",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :recognizer, RecognizerWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/recognizer_web/(live|views)/.*(ex)$",
      ~r"lib/recognizer_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[\$level] \$message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :hammer,
  backend:
    {Hammer.Backend.Redis,
     [
       expiry_ms: 60_000 * 60 * 2,
       redix_config: [host: "localhost", port: 6379],
       pool_size: 4,
       pool_max_overflow: 2
     ]}

config :recognizer, Recognizer.BigCommerce,
  client_id: "bc_id",
  client_secret: "bc_secret",
  access_token: "bc_access_token",
  store_hash: "bc_store_hash",
  login_uri: "http://localhost/login/",
  logout_uri: "http://localhost/logout",
  http_client: HTTPoison,
  enabled?: false

EOT

mix deps.get --force
mix ecto.setup