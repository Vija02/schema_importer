#!/bin/bash -e
git clone https://github.com/recursiveGecko/race_bot repo
cd repo
git pull

export DATABASE_PATH=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export TWITTER_CONSUMER_KEY=d
export TWITTER_CONSUMER_SECRET=d
export TWITTER_ACCESS_TOKEN=d
export TWITTER_ACCESS_TOKEN_SECRET=d
export PHX_HOST=d
export PORT=9999

mix deps.get --force
mix ecto.setup