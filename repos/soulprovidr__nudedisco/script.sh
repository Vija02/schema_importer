#!/bin/bash -e
git clone https://github.com/soulprovidr/nudedisco repo
cd repo

export DATABASE_PATH=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export LISTMONK_API_URL=d
export LISTMONK_ADMIN_USER=d
export LISTMONK_ADMIN_PASSWORD=d
export OPENAI_API_KEY=d
export SPOTIFY_CLIENT_ID=d
export SPOTIFY_CLIENT_SECRET=d
export SPOTIFY_REDIRECT_URI=d

sed -i -e "s/nudedisco.db/..\/database.db/g" config/config.exs

mix deps.get --force
mix ecto.migrate