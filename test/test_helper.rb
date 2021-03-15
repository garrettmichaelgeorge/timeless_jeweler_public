# https://github.com/simplecov-ruby/simplecov
require 'simplecov'
SimpleCov.start

require_relative 'test_helper_lite'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest/spec'
require 'email_spec'
require 'simple_form'
require 'view_component/test_helpers'
require 'view_component/test_case'
require_relative 'custom_assertions'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end

class ViewComponent::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper
end
