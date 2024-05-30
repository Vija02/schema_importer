#!/bin/bash -e
git clone https://github.com/joisig/turtles repo
cd repo
git pull

export DATABASE_PATH=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

touch config/tconfig.secret.exs

mix deps.get --force
mix ecto.setup