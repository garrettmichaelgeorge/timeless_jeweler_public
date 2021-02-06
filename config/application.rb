require_relative 'boot'

require 'rails/all'
require 'view_component/engine'

ActiveSupport::Deprecation.silenced = true

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TimelessJeweler
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.active_record.schema_format = :sql

    # Handle server error responses with the Rails router instead of serving
    # static pages like public/422.html, public/500.html, etc.
    # Errors are handled by ErrorsController
    config.exceptions_app = routes

    # Allow for subdirectories within config/locales
    # This is for e.g. config/locales/models and config/locales/views
    # Read more: https://rails.rubystyle.guide/#organize-locale-files
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
