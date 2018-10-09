#!/bin/sh

# fix key if needed
if [ -z "$APP_KEY" ]
then
  echo "Please re-run this container with an environment variable \$APP_KEY"
  echo "An example APP_KEY you could use is: "
  php artisan key:generate --show
  exit
fi

#if [ -f /var/lib/snipeit/ssl/snipeit-ssl.crt -a -f /var/lib/snipeit/ssl/snipeit-ssl.key ]
#then
#  a2enmod ssl
#else
#  a2dismod ssl
#fi

# create data directories
for dir in \
  'data/private_uploads' \
  'data/uploads/accessories' \
  'data/uploads/avatars' \
  'data/uploads/barcodes' \
  'data/uploads/categories' \
  'data/uploads/companies' \
  'data/uploads/components' \
  'data/uploads/consumables' \
  'data/uploads/departments' \
  'data/uploads/locations' \
  'data/uploads/manufacturers' \
  'data/uploads/models' \
  'data/uploads/suppliers' \
  'dumps' \
  'keys'
do
  [ ! -d "/app/$dir" ] && mkdir -p "/app/$dir"
done

chown -R docker:root /app/data/*
chown -R docker:root /app/dumps
chown -R docker:root /app/keys

# If the Oauth DB files are not present copy the vendor files over to the db migrations
if [ ! -f "/app/database/migrations/*create_oauth*" ]
then
  cp -ax /app/vendor/laravel/passport/database/migrations/* /app/database/migrations/
fi

#. /etc/apache2/envvars
#exec apache2 -DNO_DETACH < /dev/null