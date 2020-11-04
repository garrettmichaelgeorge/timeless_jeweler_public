ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
require 'minitest/autorun'
require 'minitest/spec'
Minitest::Reporters.use!

# require 'minitest/rails/capybara'
require 'capybara/rails'
require 'simple_form'
require 'view_component/test_helpers'
require 'view_component/test_case'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # fixture false

  # Add more helper methods to be used by all tests here...
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end
