source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jbuilder"
# gem "redis", ">= 4.0.1"
# gem "rack-cors"

gem 'sidekiq'
gem 'sidekiq-scheduler'

gem 'dotenv-rails', '~> 3.1', '>= 3.1.8'
gem 'swagger-docs'

gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot'
  gem 'faker'
  gem 'timecop'

  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'rspec-sidekiq'
end

