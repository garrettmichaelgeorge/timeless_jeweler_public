source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Use ActiveRecord::ActsAs to simulate Multiple Table Inheritance (MTI). Read more: https://github.com/manuelmeurer/active_record-acts_as
# This enables type-subtype relationships between models (e.g. Party-Person/Household)
gem 'active_record-acts_as'
# Use Active Model has_secure_password
gem 'bcrypt',                    '~> 3.1.7'
gem 'bootsnap',                  '>= 1.4.2', require: false
gem 'browser'
gem 'devise'
gem 'faker', '2.1.2'
gem 'haml'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails'
gem 'money-rails', '~> 1.12'
gem 'pg'
gem 'puma'
gem 'rack-cors',                 '~> 0.4.1'
gem 'rails',                     '~> 6.0.3'
gem 'rails-controller-testing'
gem 'rails-i18n', '~> 6.0.0'
gem 'reports_kit'
gem 'sass-rails', '~> 6.0'
gem 'simple_form'
gem 'sprockets',                 '4.0.0'
gem 'turbolinks',                '~> 5'
gem 'uglifier',                  '~> 3.0'
gem 'view_component', require: 'view_component/engine'
gem 'webpacker', '~> 5.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'pry'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'annotate'
  # Better error page. Read more: https://github.com/BetterErrors/better_errors/
  gem 'better_errors', '~> 2.7', '>= 2.7.1'
  gem 'binding_of_caller'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring',                 '2.1.0'
  gem 'spring-watcher-listen',  '~> 2.0.1'
  gem 'web-console',            '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'cucumber_factory', '2.3.1'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'guard',                    '2.16.2'
  gem 'guard-minitest',           '2.4.6'
  gem 'minitest',                 '5.11.3'
  # gem 'minitest-rails-capybara'
  gem 'minitest-reporters',       '1.3.8'
  gem 'selenium-webdriver'
  gem 'shoulda', '~> 4.0'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
