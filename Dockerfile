FROM phusion/passenger-ruby26

ARG ARG_RAILS_MASTER_KEY

ENV PORT=80                \
    NODE_ENV=production    \
    RACK_ENV=production    \
    RAILS_ENV=production   \
    APP_DIR=/home/app/html \
    RAILS_MASTER_KEY=$ARG_RAILS_MASTER_KEY

RUN mkdir -p $APP_DIR $APP_DIR/log $APP_DIR/tmp/pids

WORKDIR $APP_DIR

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN apt-get install mysql-client -y && apt-get install tzdata -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt-get update && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update && apt-get install yarn

RUN apt-get install -y shared-mime-info

ADD Gemfile      $APP_DIR/Gemfile
ADD Gemfile.lock $APP_DIR/Gemfile.lock

RUN gem install bundler \
 && bundle config --global frozen 1 && bundle install --without development test

ADD package.json $APP_DIR/package.json
ADD yarn.lock    $APP_DIR/yarn.lock
RUN yarn install --production=true

COPY --chown=app:app . $APP_DIR

RUN bundle exec rake assets:precompile

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#
EXPOSE $PORT

#
RUN chmod +x $APP_DIR/config/runner/pro.sh

#
CMD ["sh", "-c", "/home/app/html/config/runner/pro.sh"]
