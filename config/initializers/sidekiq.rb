require 'sidekiq'
require 'sidekiq/web'

REDIS_URL = ENV.fetch('REDIS_URL') { 'redis://127.0.0.1:6379/0' }

Sidekiq.configure_server do |config|
  config.redis = { url: REDIS_URL }
end

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URL }
end
