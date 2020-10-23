Feature: Authentication

  In order to use the application
  As a user
  I should be able to sign up, log in, and log out

  Scenario: New user signs up
    Given I visit the homepage
    When I fill in the signup form
    And I confirm the email
    Then I should see that my account is confirmed

  Scenario: Registered user logs in
    Given I am a registered user
    And I visit the homepage
    When I fill in the login form
    Then I should see that I am logged in

  Scenario: Registered user logs out
    Given I am a registered user
    And I have logged in
    And I visit the homepage
    When I click on the logout button
    Then I should be redirected to the login page

  Rule: The application should only be available to registered users

    Example: Accessing the inventory page as a registered user
      Given I am a registered user
      And I have logged in
      When I try to view the inventory
      Then I should see the inventory

    Example: Accessing the inventory page as an unregistered user
      Given I am not a registered user
      When I try to view the inventory
      Then I should not be able to see the inventory
      And I should be directed to log in
