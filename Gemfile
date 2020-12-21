source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 5.2.2'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'redis', '~> 3.3', '>= 3.3.1'
gem 'sidekiq', '~> 5.0', '>= 5.0.5'
gem 'webpacker', '~> 3.5'
gem 'devise', '~> 4.2'
gem 'activeadmin'
gem 'seed_migration'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'kaminari', github: 'kaminari/kaminari'
gem 'active_model_serializers', '~> 0.10.0'
gem 'rack-cors'

group :staging, :development, :test do
  gem 'puma', '~> 3.11'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # 
  gem 'codecov', :require => false
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
