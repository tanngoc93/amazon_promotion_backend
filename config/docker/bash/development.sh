#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f ${APP_DIR}/tmp/pids/server.pid

if [ "$PLATFORM" = "SIDEKIQ" ]; then
  bundle exec sidekiq -C config/sidekiq.yml -e $RAILS_ENV
else
  bundle exec rake db:create db:migrate seed:migrate && bundle exec rails s -b 0.0.0.0 -p $PORT
fi



