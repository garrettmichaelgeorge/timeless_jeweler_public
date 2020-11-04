### Devise setup ###

World(Warden::Test::Helpers)
World(Devise::Test::IntegrationHelpers)
Warden.test_mode!
After do
  Warden.test_reset!
end
