#!/bin/bash
set -e

# Check if a database is being created
if [ -n "$POSTGRES_DB" ]; then
  echo "Creating PostGIS extension in database $POSTGRES_DB"

  # Create PostGIS extension
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS postgis;
EOSQL
fi
