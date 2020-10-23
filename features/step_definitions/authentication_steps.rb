Given(/^I visit the homepage$/) do
  visit root_path
end

When(/^I fill in the signup form$/) do
  click_link_or_button 'Sign up'

  fill_in 'user_email',                 with: 'example@example.com'
  fill_in 'user_password',              with: 'pa$$word'
  fill_in 'user_password_confirmation', with: 'pa$$word'

  click_button 'Sign up'
end

When(/^I confirm the email$/) do
  open_email('example@example.com')

  visit_in_email('Confirm my account')
end

Then(/^I should see that my account is confirmed$/) do
  message = 'Your email address has been successfully confirmed'

  expect(page).to have_content(message)
end

Given(/^I am a registered user$/) do
  @registered_user = FactoryBot.create(:user,
                                       email: 'example@example.com',
                                       password: 'pa$$word')
end

When(/^I fill in the signin form$/) do
  fill_in 'user_email', with: 'example@example.com'
  fill_in 'user_password', with: 'pa$$word'
end

Given(/^I have signed in$/) do
  visit root_path

  fill_in 'user_email', with: 'example@example.com'
  fill_in 'user_password', with: 'pa$$word'

  click_link_or_button 'Sign in'
end

When(/^I click on the signout button$/) do
  click_link_or_button 'Log out'
end

Then(/^I should see that I am signed in$/) do
  expect(page).to have_content('Logged in')
end

Given(/^I am not a registered user$/) do
  @unregistered_user = nil
end

Then(/^I should be (re)directed to( the) sign( )in( page)$/) do
  expect(page).to have_content('Sign in')
end
