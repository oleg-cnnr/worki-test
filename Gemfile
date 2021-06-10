# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'dotenv-rails', '~> 2.7.6'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'slim-rails', '~> 3.2'
gem 'simple_form', '~> 5.1'
gem 'cocoon', '~> 1.2'
gem 'faraday', '~> 1.4'
gem 'aasm', '~> 5.2'
gem 'sidekiq', '~> 6.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'rubocop', '~> 1.16', require: false
end

group :test do
  gem 'database_cleaner', '~> 2.0'
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'faker', '~> 2.18'
  gem 'rails-controller-testing', '~> 1.0.5'
end
