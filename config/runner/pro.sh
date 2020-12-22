#!/bin/bash
set -e

echo "=> Platform: $PLATFORM"

if [ "$PLATFORM" = "sidekiq" ]; then
  bundle exec sidekiq -C config/sidekiq.yml -e $RAILS_ENV
else
  bundle exec rake db:migrate seed:migrate && passenger start
fi

exec "$@"
