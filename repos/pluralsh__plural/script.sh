#!/bin/bash -e
git clone https://github.com/pluralsh/plural repo

cd repo
git pull

apt install -y erlang-dev

# https://elixirforum.com/t/module-epp-dodger-is-not-available/56185/5
sed -i -e "s/0.8.5/0.8.7/g" mix.exs
# https://stackoverflow.com/questions/76562092/hi-i-had-created-elixir-project-with-phoenix-framework-there-is-yaml-file-when
sed -i -e "s/3.9.0/3.10/g" mix.exs

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=dev
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

sed -i -e "s/forge_dev/postgres/g" config/dev.exs

mix deps.update ssl_verify_fun prometheus_ex
mix deps.get --force
mix ecto.setup
