#!/bin/bash -e
git clone --recursive https://github.com/juanpabloaj/who_is_hiring_hacker_news repo
cd repo
git pull

export MIX_ENV=prod

export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od
export FLY_APP_NAME=d
export HN_PARENT_POST=d
export TECHS_OF_INTEREST=d

export DATABASE_PATH=../database.db

mix deps.get --force
mix deps.update ecto_sql
mix ecto.create && mix ecto.migrate