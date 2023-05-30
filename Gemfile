source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "rails", "~> 7.0.0"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "graphql"
gem "graphiql-rails"
gem "devise"
gem "jwt"
gem "sqlite3", "~> 1.4"
gem 'rack-cors'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "faker"
  gem 'simplecov', require: false
end

group :development do
  gem "web-console"
  gem "rubocop", require: false
  gem 'byebug'

end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
