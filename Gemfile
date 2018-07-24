# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'
gem 'rails', '~> 5.2.0'
gem  'dotenv-rails', '~> 2.1', '>= 2.1.1', :groups => [:test, :development]

gem 'active_model_serializers', '~> 0.10.0'
gem 'activeadmin', '~> 1.3'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'foreman'
gem 'grape'
gem 'grape-active_model_serializers'
gem 'grape-devise', github: 'joshmn/grape-devise'
gem 'grape-rails-cache'
gem 'jquery-rails'
gem 'mailgun_rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'pundit'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'sidekiq-scheduler', '~> 2.1.9'
gem 'sidekiq-unique-jobs'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap4'
gem 'bootsnap', require: false
gem 'bootstrap', '~> 4.1.2'

group :development, :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'ffaker', '~> 2.4'
  gem 'pry'
  gem 'pry-rails', '~> 0.3.4'
  gem 'rspec-parameterized', require: false
  gem 'rspec-rails', '~> 3.7.0'
  gem 'rspec-retry', '~> 0.4.5'
  gem 'rspec-set', '~> 0.1.3'
  gem 'rspec_profiling', '~> 0.0.5'
  gem 'selenium-webdriver'
  gem 'timecop', '~> 0.8.0'
end

group :test do
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1.2', require: false
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'faker'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'seed_dump'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]