#!/bin/bash
set -e

# Remove a potentially pre-existing passenger.pid for Rails.
if [ -f $APP_DIR/tmp/pids/passenger.pid ]; then
  rm -f $APP_DIR/tmp/pids/passenger.pid
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
