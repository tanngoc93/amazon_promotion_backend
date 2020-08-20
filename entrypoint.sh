#!/bin/bash
set -e

# Remove a potentially pre-existing passenger.pid for Rails.
rm -f ${APP_DIR}/tmp/pids/passenger.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
