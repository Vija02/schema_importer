#!/bin/bash -e
git clone https://github.com/firezone/firezone repo
cd repo
cd elixir

mix deps.get --force
DATABASE_URL=postgresql://postgres:password@localhost/postgres mix ecto.setup
