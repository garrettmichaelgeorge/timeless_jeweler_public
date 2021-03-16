# https://github.com/simplecov-ruby/simplecov
require 'simplecov'

SimpleCov.start 'rails' do
  enable_coverage :branch
  add_filter "/vendor/"
  add_filter "/node_modules/"
  add_filter "/lib/simple_form/"
  add_filter "/lib/sti_preload"

  add_group "Components", "app/components"
  add_group "Reflexes", "app/reflexes"
  add_group "Validators", "app/validators"

  # If running test in CI, generate just .json result, then we can join them later
  # else, generate the full HTML report
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::SimpleFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ]
  )

  track_files "**/*.rb"
end

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
