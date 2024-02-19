#!/bin/bash -e
git clone --recursive https://github.com/derpycoder/derpy_tools repo
cd repo

export DATABASE_PATH=../database.db

export MIX_ENV=prod

export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export FLY_APP_NAME=d
export MEILI_MASTER_KEY=d
export IMGPROXY_KEY=d
export IMGPROXY_SALT=d

mix deps.get --force
mix deps.update ecto_sql
mix ecto.create && mix ecto.migrate