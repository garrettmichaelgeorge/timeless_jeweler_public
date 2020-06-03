source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby                             '2.7.1'

# Use ActiveRecord::ActsAs to simulate Multiple Table Inheritance (MTI). Read more: https://github.com/manuelmeurer/active_record-acts_as
# This enables type-subtype relationships between models (e.g. Party-Person/Household)
gem 'active_record-acts_as'
# Use Active Model has_secure_password
gem 'bcrypt',                    '~> 3.1.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap',                  '>= 1.4.2', require: false
gem 'browser'
gem 'devise'
# Create placeholder data
gem 'faker',                     '2.1.2'
gem 'haml'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder',                  '~> 2.7'
gem 'jquery-rails'
gem 'money-rails',               '~> 1.12'
gem 'pg'
gem 'puma'
gem 'rails',                     '~> 6.0.3'
gem 'rails-controller-testing'
gem 'sass-rails',                '~> 6.0'
gem 'simple_form'
gem 'sprockets',                 '4.0.0'
gem 'turbolinks',                '~> 5'
gem 'uglifier',                  '~> 3.0'
gem 'view_component'
gem 'webpacker',                 '~> 5.0'


# Use Active Storage variant
# gem 'image_processing', '~> 1.2'


group :development, :test do
  gem 'pry'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3', '~> 1.4'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console',            '>= 3.3.0'
  gem 'listen', '>= 3.0.5',     '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring',                 '2.1.0'
  gem 'spring-watcher-listen',  '~> 2.0.1'
  # Better error page. Read more: https://github.com/BetterErrors/better_errors/
  gem 'better_errors',          '~> 2.7', '>= 2.7.1'
  gem 'binding_of_caller'
  gem 'annotate'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara',                 '>= 2.15'
  # gem 'minitest-rails-capybara'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # Automatically run tests with Guard
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.3.8'
  gem 'guard',                    '2.16.2'
  gem 'guard-minitest',           '2.4.6'
end

group :production do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
