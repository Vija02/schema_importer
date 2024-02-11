#!/bin/bash -e
git clone https://github.com/aschiavon91/harpoon repo
cd repo

export DATABASE_FILE=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

mix deps.get --force
mix ecto.setup