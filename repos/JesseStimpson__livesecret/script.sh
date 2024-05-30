#!/bin/bash -e
git clone https://github.com/JesseStimpson/livesecret repo
cd repo
git pull

export DATABASE_PATH=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

export BEHIND_PROXY=1

mix deps.get --force
mix ecto.setup