#!/bin/bash

set -e

cd /usr/local/src/security_monkey


dockerize -timeout 300s -wait tcp://postgres:5432
SECURITY_MONKEY_SETTINGS=/usr/local/src/security_monkey/env-config/config-deploy.py python manage.py db upgrade
chown -R www-data /var/log/security_monkey

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
