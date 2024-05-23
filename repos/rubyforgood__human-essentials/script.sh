#!/bin/bash -e
git clone --recursive https://github.com/rubyforgood/human-essentials repo

cp repo/db /dsl_rails_placeholder/ -R
cd /dsl_rails_placeholder

if test -f "db/schema.rb"; then
  rails db:schema:load
else
	rails db:migrate
fi
