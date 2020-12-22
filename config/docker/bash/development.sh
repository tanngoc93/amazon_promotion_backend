#!/bin/bash
set -e

echo "=> Platform: $PLATFORM"

#
bundle check || bundle install

#
if [ ! -d $APP_DIR/tmp/pids ]; then
  mkdir -p $APP_DIR/tmp/pids
fi

# Remove a potentially pre-existing server.pid for Rails.
if [ -f $APP_DIR/tmp/pids/server.pid ]; then
  rm -f $APP_DIR/tmp/pids/server.pid
fi

if [ "$PLATFORM" = "SIDEKIQ" ]; then
  bundle exec sidekiq -C config/sidekiq.yml -e $RAILS_ENV
else
  bundle exec rake db:create db:migrate seed:migrate && bundle exec puma -C config/puma.rb
fi

exec "$@"
