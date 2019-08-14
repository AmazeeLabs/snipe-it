#!/bin/bash

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
  'data/dumps' \
  'data/keys'
do
  [ ! -d "/app/$dir" ] && mkdir -p "/app/$dir"
done

rm -r "/app/storage/private_uploads"
 && mkdir -p "/app/data/private_uploads" && ln -fs "/app/data/private_uploads" "/app/storage/private_uploads"
 && rm -rf "/app/public/uploads"
 && mkdir -p "/app/data/uploads" && ln -fs "/app/data/uploads" "/app/public/uploads"
 && mkdir -p "/app/data/dumps" && rm -r "/app/storage/app/backups" && ln -fs "/app/data/dumps" "/app/storage/app/backups"
 && mkdir -p "/app/data/keys" && ln -fs "/app/data/keys/oauth-private.key" "/app/storage/oauth-private.key"
 && ln -fs "/app/data/keys/oauth-public.key" "/app/storage/oauth-public.key"
