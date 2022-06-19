#!/bin/bash
set -e

bundle exec sidekiq -C config/sidekiq.yml -e $RAILS_ENV

exec "$@"
