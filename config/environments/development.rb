Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = true

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :redis_cache_store, { driver: :hiredis, url: ENV.fetch('REDIS_URL') do
                                                                        'redis://localhost:6379/1'
                                                                      end }
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store sessions in Redis for compatibility with StimulusReflex
  # https://docs.stimulusreflex.com/appendices/deployment#session-storage
  config.session_store :cache_store, key: '_session_development', compress: true, pool_size: 5, expire_after: 1.year

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Set default url options for both ActionController and ActionMailer
  config.action_controller.default_url_options = { host: ENV.fetch('LOCAL_IP_ADDRESS') { 'localhost' },
                                                   port: 3000 }
  config.action_mailer.default_url_options = config.action_controller.default_url_options

  # Allow connections from within network (for previewing on mobile devices)
  config.web_console.whitelisted_ips = [ENV.fetch('LOCAL_NETWORK_IP_ADDRESS') { '' }]

  # Print deprecation notices to the Rails logger.
  # config.active_support.deprecation = :log
  config.active_support.deprecation = false

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Suppress logger output for asset requests.
  config.assets.quiet = false

  # Set logger level (options are :debug, :info, :warn, :error, :fatal, :unknown)
  # https://docs.stimulusreflex.com/troubleshooting#server-side
  config.log_level = :debug

  # Raises error for missing translations.
  config.i18n.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Lazy load images using HTML5 loading attribute
  # https://edgeguides.rubyonrails.org/configuring.html#configuring-action-view
  # https://html.spec.whatwg.org/#lazy-loading-attributes
  # FIXME: This breaks on launch
  # config.action_view.image_loading = 'lazy'
end
