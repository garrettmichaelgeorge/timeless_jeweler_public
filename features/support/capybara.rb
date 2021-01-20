### Capybara setup ###
require 'capybara/apparition'

Capybara.javascript_driver = :apparition

Capybara.configure do |config|
  config.default_max_wait_time = 2
  config.automatic_label_click = true
end
