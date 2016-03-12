source 'https://rubygems.org'

ruby '2.3.0'

gem 'autoprefixer-rails'
gem 'bourbon', '~> 4.2.0'
gem 'delayed_job_active_record'
gem 'email_validator'
gem 'high_voltage'
gem 'jquery-rails'
gem 'neat', '~> 1.7.0'
gem 'newrelic_rpm'
gem 'normalize-rails', '~> 3.0.0'
gem 'pg'
gem 'puma'
gem 'rack-canonical-host'
gem 'rails', '~> 4.2.0'
gem 'recipient_interceptor'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks'
gem 'uglifier'

group :development do
  gem 'foreman'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.4.0'
end

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rails_stdout_logging'
  gem 'rack-timeout'
end
