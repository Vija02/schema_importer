#!/bin/bash -e
git clone https://github.com/FarmBot/farmbot_os repo
cd repo

sqlite3 database.db < priv/repo/structure.sql