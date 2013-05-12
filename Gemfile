source 'http://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.0.rc1'

gem 'sass-rails',   '~> 4.0.0.rc1'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'
gem 'mongoid', git: "git://github.com/mongoid/mongoid.git"
gem 'video_info'
gem 'stringex', git: 'git://github.com/rsl/stringex.git'
gem 'formtastic'
gem 'haml-rails'
gem 'swf_fu'
gem 'newrelic_rpm'
gem 'newrelic_moped'
gem 'airbrake'
gem 'sitemap_generator'

gem 'puma'

group :production do
  # needed for heroku https://devcenter.heroku.com/articles/rails4
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

group :test, :development do
  gem "rspec-rails"
end