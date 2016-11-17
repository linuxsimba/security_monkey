#!/bin/bash

set -e

cd /usr/local/src/security_monkey
export SECURITY_MONKEY_SETTINGS=/usr/local/src/security_monkey/env-config/config-deploy.py
python manage.py db upgrade
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
