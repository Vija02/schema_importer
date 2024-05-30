#!/bin/bash -e
git clone https://github.com/FranckKe/mersea repo
cd repo
git pull

export DB_DATABASE=postgres 
export DB_USERNAME=postgres 
export DB_HOSTNAME=localhost 
export DATABASE_PORT=5432 
export DB_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export RAILS_ENV=development

sed -i -e "s/mersea_development/postgres/g" config/database.yml

bundle install
rails db:schema:load