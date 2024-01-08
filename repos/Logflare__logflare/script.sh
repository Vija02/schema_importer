#!/bin/bash -e
git clone https://github.com/Logflare/logflare repo
cd repo

curl https://sh.rustup.rs -sSf | bash -s -- -y
source "$HOME/.cargo/env"

touch .dev.env
touch gcloud.json

sed -i -e "s/logflare_dev/postgres/g" config/dev.exs

mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
