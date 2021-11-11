#!/usr/bin/env bash

# WARNING: This script will be executed as the "admin" user.
# If you want to run it as another user, use su/sudo.

echo -n "netdata:" | sudo tee /var/www/webapp/conf/netdata/password
echo "$(curl -s http://169.254.169.254/latest/meta-data/instance-id | mkpasswd --stdin --method=sha-256)" | sudo tee -a /var/www/webapp/conf/netdata/password

cd /var/www/webapp/src

# Install some dependencies
pip install -r requirements.txt

# Maybe collect statics?
#python3 manage.py collectstatic --no-input

# Maybe run migrations?
# python3 manage.py migrate

# We want to restart uWSGI after installing our dependencies
sudo systemctl restart uwsgi