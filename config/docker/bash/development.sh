#!/bin/bash
set -e

echo "=> Platform: $PLATFORM"

# Remove a potentially pre-existing server.pid for Rails.
rm -f $APP_DIR/tmp/pids/server.pid

#
bundle check || bundle install

if [ "$PLATFORM" = "SIDEKIQ" ]; then
  bundle exec sidekiq -C config/sidekiq.yml -e $RAILS_ENV
else
  bundle exec rake db:create db:migrate seed:migrate && bundle exec puma -C config/puma.rb
fi

exec "$@"
