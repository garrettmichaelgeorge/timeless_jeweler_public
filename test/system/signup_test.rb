require 'test_helper'

class SignupTest < ActionDispatch::SystemTestCase
  include ActionMailer::TestHelper

  # driven_by :selenium, using: :headless_chrome

  test 'signing up as a clerk' do
    visit new_user_registration_url

    fill_in 'user_email',                 with: 'example@example.com', wait: 0
    fill_in 'user_password',              with: 'pa$$word',            wait: 0
    fill_in 'user_password_confirmation', with: 'pa$$word',            wait: 0

    assert_emails 1 do
      click_on 'Sign up'
    end
  end
end
