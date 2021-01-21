### Capybara setup ###
require 'capybara/apparition'

Capybara.register_driver :apparition_debug do |app|
  Capybara::Apparition::Driver.new(app, inspector: true)
end

Capybara.configure do |config|
  config.javascript_driver = :apparition_debug
  config.default_max_wait_time = 2
  config.automatic_label_click = true
end
