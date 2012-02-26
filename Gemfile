source 'https://rubygems.org'

gem 'rails', '~> 3.2.1'

gem 'russian'

gem 'mysql2'

gem 'devise', '~> 2.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'

  gem 'uglifier', '~> 1.0.3'
end

gem 'haml'

gem 'jquery-rails'

gem 'anjlab-bootstrap-rails', '~> 2.0', :require => 'bootstrap-rails'

gem 'active_scaffold'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

group :development do
  # Deployment
  gem 'capistrano'
  # Debugging
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :production do
  # Production application server
  gem 'unicorn'
end
