#!/bin/sh
set -e

# Restore the database if it does not already exist.
if [ -f /directus/database/data.db ]; then
  echo "Database already exists, skipping restore"
else
  echo "No database found, restoring from replica if exists"
  /usr/local/bin/litestream restore -if-replica-exists /directus/database/data.db
  npx directus bootstrap
fi

# Run litestream with your app as the subprocess.
/usr/local/bin/litestream replicate -exec "npx directus start"
