source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'importmap-rails'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
#gem "pg", "~> 1.1"
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem "image_processing", "~> 1.2"

gem 'enumerate_it'
gem 'devise'
gem 'devise-tailwindcssed', github: 'invenio-br/devise-tailwindcssed'
gem 'lookbook', '~> 0.9.1'
gem 'slim'
gem 'slim-rails'
gem 'view_component'
gem 'heroicon'
gem 'simple_form'

gem 'pundit'
gem 'rolify'

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'awesome_print'
  gem 'better_errors', '>= 2.7.1'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'letter_opener'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rspec-rails'

  # Security tools
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'ruby_audit'

  # Linting tools
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers'
  gem 'simplecov'
end
