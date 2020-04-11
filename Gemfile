source 'https://rubygems.org'

ruby '2.6.6'

# Application server
gem 'bootsnap', require: false
gem 'rails'

# Database
gem 'pg'

# Webserver
gem 'puma'

# Views
gem 'bootstrap', '~> 4.3.1'
gem 'google-analytics-rails'
gem 'sassc-rails'
gem 'will_paginate'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
