#!/usr/bin/env bash

# WARNING: This script will be executed as the "admin" user.
# If you want to run it as another user, use su/sudo.

cd /var/www/webapp/src

# Install some dependencies
pip3 install -r requirements.txt

# Maybe collect statics?
#python3 manage.py collectstatic --no-input

# Maybe run migrations?
# python3 manage.py migrate

# We want to restart uWSGI after installing our dependencies
sudo systemctl restart uwsgi