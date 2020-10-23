Given(/^I visit the homepage$/) do
  visit root_path
end

When(/^I fill in the signup form$/) do
  click_link_or_button 'Sign up'

  fill_in 'user_email',                 with: 'tester@example.com'
  fill_in 'user_password',              with: 'pa$$word'
  fill_in 'user_password_confirmation', with: 'pa$$word'

  click_button 'Sign up'
end

When(/^I confirm the email$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see that my account is confirmed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am a registered user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I fill in the login form$/) do
  fill_in 'user_email', with: 'tester@example.com'
  fill_in 'user_password', with: 'pa$$word'
end

Given(/^I have logged in$/) do
  visit root_path

  fill_in 'user_email', with: 'tester@example.com'
  fill_in 'user_password', with: 'pa$$word'
end

When(/^I click on the logout button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be redirected to the login page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see that I am logged in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am not a registered user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be directed to log in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see that I am logged in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am not a registered user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be directed to log in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
