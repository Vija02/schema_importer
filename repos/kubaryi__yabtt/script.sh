#!/bin/bash -e
git clone https://github.com/kubaryi/yabtt repo
cd repo
git pull

export DATABASE_PATH=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

sed -i -e "s/\/var\/lib\/sqlite3\/yabtt.db/..\/database.db/g" config/config.exs

mix deps.get --force
mix deps.update ecto_sql
mix ecto.setup