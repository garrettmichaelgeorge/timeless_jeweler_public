Feature: Authentication

  In order to use the application,
  as a clerk,
  I should be able to sign up, sign in, and sign out.

  Scenario: New clerk signs up
    Given I visit the homepage
    When I fill in the signup form
    Then I should receive an email with subject "Account confirmation"
      And I should have 1 email

    When I open the email
      And I follow "Confirm your account" in the email
    Then I should see that my account is confirmed

  Scenario: Registered clerk signs in
    Given I am a registered clerk
    And I visit the homepage
    When I fill in the signin form
    Then I should see that I am signed in

  Scenario: Registered clerk signs out
    Given I am a registered clerk
    And I have signed in
    And I visit the homepage
    When I click on the signout button
    Then I should be redirected to the signin page
