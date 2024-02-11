#!/bin/bash -e
git clone https://github.com/teesloane/galley repo
cd repo

export DATABASE_PATH=../database.db

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export SENDGRID_API=d

mix deps.get --force
mix ecto.setup