source "http://rubygems.org"

ruby "2.5.8"

gem "airbrake"
gem "coffee-rails"
gem "dotenv-rails"
gem "formtastic"
gem "haml-rails"
gem "jquery-rails"
gem "newrelic_rpm"
gem "pg", "~> 0.21" # unlock when upgrading to Rails 5.2 (https://github.com/rails/rails/issues/31673)
gem "rails", "~> 4.2.11.3"
gem "sass-rails"
gem "sitemap_generator"
gem "sprockets", "~> 3.7.2"
gem "stringex" # acts_as_url
gem "uglifier"
gem "video_info"

group :development do
  gem "quiet_assets"
  gem "web-console"
end

group :test, :development do
  gem "rspec-rails"
  gem "byebug"
end

group :production do
  gem "rails_12factor"
  gem "heroku-deflater"
  gem "puma"
end
