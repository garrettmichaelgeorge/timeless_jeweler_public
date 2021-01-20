### GIVEN ###

Given(/^I visit the homepage$/) do
  visit root_path
end

Given('I am a registered clerk/user') do
  @registered_clerk = FactoryBot.create(:user)
  # confirm @registered_clerk
end

Given(/^I have signed in$/) do
  sign_in @registered_clerk
end

Given('I am not a registered clerk/user') do
  @unregistered_clerk = nil
end

### WHEN ###

When(/^I fill in the signup form$/) do
  @clerk_attrs = FactoryBot.attributes_for(:clerk)
  sign_up = I18n.t('actions.sign_up')

  click_link_or_button sign_up
  fill_in 'user_email',                 with: @clerk_attrs[:email]
  fill_in 'user_password',              with: @clerk_attrs[:password]
  fill_in 'user_password_confirmation', with: @clerk_attrs[:password]
  click_button sign_up
end

When(/^I fill in the signin form$/) do
  sign_in = I18n.t('actions.sign_in')

  fill_in 'user_email',    with: @registered_clerk.email
  fill_in 'user_password', with: @registered_clerk.password
  click_button sign_in
end

When(/^I confirm the email$/) do
  confirm = I18n.t('actions.confirm')
  @clerk_attrs ||= FactoryBot.attributes_for(:clerk)

  open_email(@clerk_attrs[:email])
  visit_in_email(confirm)
end

When(/^I click on the signout button$/) do
  sign_out = I18n.t('actions.sign_out')
  click_on sign_out
end

### THEN ###

Then(/^I should see that I am signed in$/) do
  message = I18n.t('devise.sessions.signed_in')
  page.has_content?(message)
end

Then('I should be directed to sign in') do
  sign_in = I18n.t('actions.sign_in')
  page.has_content?(sign_in)
end

Then('I should be redirected to the signin page') do
  sign_in = I18n.t('actions.sign_in')
  page.has_content?(sign_in)
end

Then(/^I should see that my account is confirmed$/) do
  notification = I18n.t('devise.confirmations.confirmed')
  page.has_content?(notification)
end
