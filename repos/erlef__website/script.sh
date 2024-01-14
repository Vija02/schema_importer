#!/bin/bash -e
git clone https://github.com/erlef/website repo
cd repo

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export SECRET=d
export URL_PORT=2345
export ERLEF_DOMAIN=d
export DATABASE=postgres
export DATABASE_USER=postgres
export DATABASE_PASSWORD=postgres

export SMTP_RELAY_HOST=d
export WA_ACCOUNT_ID=d
export WAPI_API_KEY=d
export WAPI_CLIENT_ID=d
export WAPI_CLIENT_SECRET=d
export GITHUB_APP_PEM=d
export GITHUB_APP_ID=d
export GITHUB_APP_INSTALL_ID=d
export ERLEF_REPORT_SUBMISSION_REPO=d
export API_KEY=d
export CODE_BEAM_V_AMERICA_2021_DISCOUNT_LINK=d
export CODE_BEAM_V_AMERICA_2021_KEYNOTE_LINK=d
export CODE_BEAM_V_AMERICA_2021_BOF_LINK=d
export ERLEF_SLACK_BOT_TOKEN=d
export ERLEF_SLACK_INVITE_CHANNEL=d
export LOGFLARE_API_KEY=d
export LOGFLARE_SOURCE_ID=d

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

mix deps.get --force
mix ecto.setup