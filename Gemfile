source "https://rubygems.org"

ruby "2.6.3"

# Temporary fix
gem "sprockets", "=2.11.0"

gem 'rails', '4.1.1'
gem "jquery-rails"
gem "sass-rails"
gem "uglifier",                ">= 1.3.0"
gem "will_paginate", git: "https://github.com/nazgum/will_paginate"
gem "will_paginate-bootstrap"

group :development do
  gem 'sqlite3'
  gem "better_errors"
  gem "binding_of_caller"
  gem "foreman"
  gem "guard-rspec"
  gem "gx"

  # For Rails 4.1
  gem "spring"
end

group :production, :staging do
  gem "newrelic_rpm"
  gem "puma"
  gem "rails_12factor"
  gem "pg"
end
