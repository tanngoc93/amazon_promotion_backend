#!/bin/bash
set -e

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

bundle exec rails db:create db:migrate && bundle exec puma -C config/puma.rb

exec "$@"