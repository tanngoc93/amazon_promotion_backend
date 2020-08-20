# Change to match your CPU core count
workers ENV['WEB_CONCURRENCY'].to_i || 1

# Min and Max threads per worker
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 2 }
threads threads_count, threads_count

port            ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
rails_env    =  ENV.fetch("RAILS_ENV") { "development" }
environment     rails_env

app_dir      =  File.expand_path("../..", __FILE__)
shared_dir   =  "#{app_dir}/tmp"

activate_control_app

on_worker_boot do
  require "active_record"
  db_config = ENV.fetch("CLEARDB_DATABASE_URL") { YAML.load_file("#{app_dir}/config/database.yml") }
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(db_config[rails_env])
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
