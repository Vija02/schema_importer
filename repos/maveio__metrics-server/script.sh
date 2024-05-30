#!/bin/bash -e
git clone https://github.com/maveio/metrics-server repo
cd repo
git pull

su postgres -c 'pg_ctl -D /var/lib/postgresql/data stop'

curl -s https://packagecloud.io/install/repositories/timescale/timescaledb/script.deb.sh | bash
apt-get install -y timescaledb-2-postgresql-16

/usr/bin/timescaledb-tune --quiet --yes

su postgres -c 'pg_ctl -D /var/lib/postgresql/data start'
wait-until "psql -U postgres -c 'select 1'"

export DATABASE_NAME=postgres 
export DATABASE_USER=postgres 
export DATABASE_HOST=localhost 
export DATABASE_PORT=5432 
export DATABASE_PASSWORD=postgres 
export DATABASE_URL=postgresql://postgres:password@localhost/postgres 

export MIX_ENV=prod
export SECRET_KEY_BASE=BVPgT+mzxjDi6FiG4f4+6mxqE731gDxpT5kw0fp1tAs5taquyZ39kOEUbQBlm4Od

mix deps.get --force
mix ecto.setup