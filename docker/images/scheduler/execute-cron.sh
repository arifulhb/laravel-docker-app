#!/bin/bash

printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export APP_" > /var/www/project.env.sh
printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export LOG_" > /var/www/project.env.sh
printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export DB_" > /var/www/project.env.sh
printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export REDIS_" > /var/www/project.env.sh
printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export MAIL_" >> /var/www/project.env.sh
printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export AWS_" >> /var/www/project.env.sh

chmod +x /var/www/project.env.sh
source /var/www/project.env.sh

/usr/local/bin/php /var/www/app/artisan schedule:run >> /var/log/cron.log 2>&1
