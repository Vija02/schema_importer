#!/bin/bash -e
git clone --recursive https://github.com/sharetribe/sharetribe repo
cd repo
git pull

mariadb -uroot -ppassword db < db/structure.sql