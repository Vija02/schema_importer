#!/bin/bash -e
git clone https://github.com/fly-apps/live_beats repo
cd repo

export MIX_ENV=prod
export LIVE_BEATS_GITHUB_CLIENT_ID=d
export LIVE_BEATS_GITHUB_CLIENT_SECRET=d
export FLY_APP_NAME=d
export SECRET_KEY_BASE=d
export LIVE_BEATS_SERVER_IP=d

mix deps.get --force
mix deps.update ecto
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
