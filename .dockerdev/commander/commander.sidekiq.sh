#!/bin/bash
set -e

#
bundle check || bundle install

bundle exec sidekiq -C config/sidekiq.yml -e $RAILS_ENV

exec "$@"