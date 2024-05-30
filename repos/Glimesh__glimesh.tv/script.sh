#!/bin/bash -e
git clone https://github.com/Glimesh/glimesh.tv repo
cd repo
git pull

export MIX_ENV=releases
export SECRET_KEY_BASE=d
export LIVE_VIEW_SIGNING_SALT=d
export URL_HOST=d
export URL_PORT=d
export URL_SCHEME=d
export STRIPE_PUBLIC_API_KEY=d
export STRIPE_API_KEY=d
export STRIPE_CONNECT_CLIENT_ID=d
export STRIPE_WEBHOOK_SECRET=d
export DATABASE_URL=postgresql://postgres:password@localhost/postgres

sed -i -e "s/plug Plug.Parsers/# plug Plug.Parsers/g" lib/glimesh_web/router.ex
sed -i -e "s/socket_options/# socket_options/g" config/releases.exs

mix deps.get --force
mix deps.update ssl_verify_fun phoenix_markdown
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.migrate
