#!/bin/bash -e
git clone https://github.com/pluralsh/plural repo

cd repo

apt install -y erlang-dev

# https://elixirforum.com/t/module-epp-dodger-is-not-available/56185/5
sed -i -e "s/0.8.5/0.8.7/g" mix.exs
# https://stackoverflow.com/questions/76562092/hi-i-had-created-elixir-project-with-phoenix-framework-there-is-yaml-file-when
sed -i -e "s/3.9.0/3.10/g" mix.exs

mix deps.update ssl_verify_fun prometheus_ex
mix deps.get --force
DATABASE_NAME=postgres DATABASE_USER=postgres DATABASE_HOST=localhost DATABASE_PORT=5432 DATABASE_PASSWORD=postgres DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
