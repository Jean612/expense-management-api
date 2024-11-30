source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem 'kamal', require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem 'thruster', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.1', '>= 3.1.1'
  gem 'rspec', '~> 3.12'
  gem 'rspec_junit_formatter', '~> 0.6.0'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'rubocop', '~> 1.51', '>= 1.51.0', require: false
  gem 'rubocop-graphql',        '~> 1.2', '>= 1.2.0', require: false
  gem 'rubocop-performance',    '~> 1.16', '>= 1.16.0', require: false
  gem 'rubocop-rails',          '~> 2.18', '>= 2.18.0', require: false
  gem 'rubocop-rails-omakase', require: false
  gem 'rubocop-rspec',          '~> 2.19', '>= 2.19.0', require: false
  gem 'shoulda',                '~> 4.0.0'
  gem 'simplecov',              '~> 0.22.0', require: false
  gem 'webmock',                '~> 3.18', '>= 3.18.1'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.1'
end

# Database
gem 'annotaterb'

# Environment variables
gem 'figaro'

# GraphQL
gem 'batch-loader', '~> 0.3.0'
gem 'graphql', '~> 2.4', '>= 2.4.3'

# Math and financial
gem 'money-rails', '~> 1.15'

# Security and authentication
gem 'active_model_serializers'
gem 'bcrypt'
gem 'cancancan'
gem 'jwt'
gem 'rack-cors'
gem 'strong_password'
