### GIVEN ###

Given(/^I visit the homepage$/) do
  visit root_path
end

Given(/^I am a registered user$/) do
  @registered_user = FactoryBot.create(:user)
  # confirm @registered_user
end

Given(/^I have signed in$/) do
  # visit root_path

  # fill_in 'user_email', with: @registered_user.email
  # fill_in 'user_password', with: @registered_user.password

  # click_on 'Sign in'
  sign_in @registered_user
end

Given(/^I am not a registered user$/) do
  @unregistered_user = nil
end

### WHEN ###

When(/^I fill in the signup form$/) do
  click_link_or_button 'Sign up'

  fill_in 'user_email',                 with: 'example@example.com'
  fill_in 'user_password',              with: 'pa$$word'
  fill_in 'user_password_confirmation', with: 'pa$$word'

  click_button 'Sign up'
end

When(/^I fill in the signin form$/) do
  fill_in 'user_email',                 with: @registered_user.email
  fill_in 'user_password',              with: @registered_user.password

  click_button 'Sign in'
end

When(/^I confirm the email$/) do
  open_email('example@example.com')

  visit_in_email('Confirm my account')
end

When(/^I click on the signout button$/) do
  click_on 'Log out'
end

### THEN ###

Then(/^I should see that I am signed in$/) do
  page.has_content?('Logged in')
end

Then(/^I should be (re)?directed to( the)? sign ?in( page)?$/) do
  page.has_content?('Sign in')
end

Then(/^I should see that my account is confirmed$/) do
  message = 'Your email address has been successfully confirmed'

  page.has_content?(message)
end
