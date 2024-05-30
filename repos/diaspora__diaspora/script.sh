#!/bin/bash -e
git clone --recursive https://github.com/diaspora/diaspora repo
cd repo
git reset --hard
git pull

export DB_NAME=postgres 
export DB_USER=postgres 
export DB_HOST=localhost 
export DB_PORT=5432 
export DB_PASS=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export RAILS_ENV=development

cat <<EOT > config/diaspora.toml
[configuration.environment]

url = "https://mysite.com/"

[configuration.environment.sidekiq]
[configuration.environment.s3]
[configuration.environment.assets]
[configuration.environment.logging]
[configuration.server]
[configuration.map.mapbox]
[configuration.privacy]
[configuration.privacy.statistics]
[configuration.privacy.camo]
[configuration.settings]
[configuration.settings.welcome_message]
[configuration.settings.invitations]
[configuration.settings.paypal_donations]
[configuration.settings.community_spotlight]
[configuration.settings.captcha]
[configuration.settings.terms]
[configuration.settings.maintenance]
[configuration.settings.default_metas]
[configuration.settings.csp]
[configuration.services]
[configuration.mail]
[configuration.mail.smtp]
[configuration.mail.sendmail]
[configuration.admins]
[production]
[production.mail.sendmail]
[development]
[development.mail.sendmail]
EOT

cat <<EOT > Gemfile
source "https://rubygems.org"

gem "rails", "6.1.7.4"

# needed for actionmailer, can be removed when upgrading to rails 7
gem "net-imap", require: false
gem "net-pop", require: false
gem "net-smtp", require: false

# Legacy Rails features, remove me!
# responders (class level)
gem "responders", "3.1.0"

# Appserver

gem "puma", "6.3.0", require: false

# Federation

gem "diaspora_federation-json_schema", "1.1.0"
gem "diaspora_federation-rails",       "1.1.0"

# API and JSON

gem "acts_as_api", "1.0.1"
gem "json",        "2.6.3"
gem "json-schema", "4.0.0"
gem "yajl-ruby",   "1.4.3"

# Authentication

gem "devise", "4.9.2"
gem "devise_lastseenable", "0.0.6"
gem "devise-two-factor", "4.1.0"
gem "rqrcode", "2.2.0"

# Captcha

gem "simple_captcha2", "0.5.0", require: "simple_captcha"

# Background processing

gem "redis", "4.8.1"
gem "sidekiq", "6.5.9"

# Scheduled processing

gem "sidekiq-cron", "1.10.1"

# Compression

gem "terser", "1.1.16"

# Configuration

gem "configurate", "0.5.0"
gem "toml-rb", "2.2.0"

# Cross-origin resource sharing

gem "rack-cors", "2.0.1", require: "rack/cors"

# CSS

gem "autoprefixer-rails",     "10.4.13.0"
gem "bootstrap-switch-rails", "3.3.3" # 3.3.4 and 3.3.5 is broken, see https://github.com/Bttstrp/bootstrap-switch/issues/691
gem "sprockets-rails",        "3.4.2"

# Database

group :mysql, optional: true do
  gem "mysql2", "0.5.5"
end
group :postgresql, optional: true do
  gem "pg",     "1.5.3"
end

gem "activerecord-import", "1.4.1"

# File uploading

gem "carrierwave", "2.2.4"
gem "fog-aws",     "3.19.0"
gem "mini_magick", "4.12.0"

# GUID generation
gem "uuid", "2.3.9"

# JavaScript

gem "babel-transpiler",  "0.7.0"
gem "handlebars_assets", "0.23.9"
gem "jquery-rails",      "4.5.0"
gem "jquery-ui-rails",   "5.0.5"
gem "js_image_paths",    "0.2.0"
gem "js-routes",         "2.2.5"

# Localization

gem "http_accept_language", "2.1.1"
gem "rails-i18n",           "7.0.7"

# Map
gem "leaflet-rails", "1.9.3"

# Parsing

gem "nokogiri",          "1.15.2"
gem "open_graph_reader", "0.7.2" # also update User-Agent in features/support/webmock.rb and open_graph_cache_spec.rb
gem "redcarpet",         "3.6.0"
gem "ruby-oembed",       "0.16.1"

# RTL support

gem "string-direction", "1.2.2"

# Security Headers

gem "secure_headers", "6.5.0"

# Services

gem "omniauth",                       "2.1.1"
gem "omniauth-rails_csrf_protection", "1.0.1"
gem "omniauth-tumblr",                "1.2"
gem "omniauth-twitter",               "1.4.0"
gem "omniauth-wordpress",             "0.2.2"

# OpenID Connect
gem "openid_connect", "2.2.0"

# Serializers

gem "active_model_serializers", "0.9.9"

# Tags

gem "acts-as-taggable-on", "9.0.1"

# URIs and HTTP

gem "addressable",              "2.8.4", require: "addressable/uri"
gem "faraday",                  "2.7.7"
gem "faraday-cookie_jar",       "0.0.7"
gem "faraday-follow_redirects", "0.3.0"
gem "faraday-typhoeus",         "1.0.0", require: false
gem "typhoeus",                 "1.4.0"

# Views

gem "gon",                     "6.4.0"
gem "hamlit",                  "3.0.3"
gem "mobile-fu",               "1.4.0"
gem "rails-timeago",           "2.20.0"
gem "will_paginate",           "4.0.0"

# Logging

gem "logging-rails", "0.6.0", require: "logging/rails"

# Reading and writing zip files

gem "rubyzip", "2.3.2", require: "zip"

# Prevent occasions where minitest is not bundled in
# packaged versions of ruby. See following issues/prs:
# https://github.com/gitlabhq/gitlabhq/issues/3826
# https://github.com/gitlabhq/gitlabhq/pull/3852
# https://github.com/discourse/discourse/pull/238
gem "minitest", "5.18.1"

gem "versionist", "2.0.1"
EOT

# rm Gemfile
rm Gemfile.lock

# cp /dsl_rails_placeholder/Gemfile ./
cp /dsl_rails_placeholder/Gemfile.lock ./

# sed -i -e "s/test/test/g" lib/configuration_methods.rb

# cp config/diaspora.toml.example config/diaspora.toml
cp /helpers/database.yml config/database.yml

# echo "gem \"addressable\",              \"2.8.4\", require: \"addressable/uri\"" >> Gemfile
# bundle add configurate tomlrb rack-oauth2 listen turbo_dev_assets acts-as-taggable-on carrierwave rack-cors devise diaspora_federation-rails

bundle install
rails db:schema:load