#!/bin/sh -e
git clone https://github.com/FarmBot/farmbot_os repo
cd repo
git pull

sqlite3 ../database.db < priv/repo/structure.sql