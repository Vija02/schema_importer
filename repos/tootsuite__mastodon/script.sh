#!/bin/bash -e
git clone --recursive https://github.com/tootsuite/mastodon repo
cd repo
git pull

export DB_NAME=postgres 
export DB_USER=postgres 
export DB_HOST=localhost 
export DB_PORT=5432 
export DB_PASS=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export RAILS_ENV=development

apt-get install -y libidn11-dev

bundle install
rails db:schema:load