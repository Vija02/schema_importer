#!/bin/bash -e
git clone --recursive https://github.com/standardnotes/listed repo

cd repo && git pull && cd ..

cp repo/db /dsl_rails_placeholder/ -R
cd /dsl_rails_placeholder

sed -i 's/utf8mb4_0900_ai_ci/utf8_general_ci/g' db/schema.rb
sed -i 's/CHARSET=utf8mb4/CHARSET=utf8/g' db/schema.rb
sed -i 's/ COLLATE=utf8mb4_unicode_ci//g' db/schema.rb

if test -f "db/schema.rb"; then
  rails db:schema:load
else
	rails db:migrate
fi
