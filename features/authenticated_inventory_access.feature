Feature: Authenticated Inventory Access

  In order to secure my inventory,
  as a merchant representative,
  I want to restrict my inventory access to approved users only.

  Background:
    Given I am a registered clerk
      And I have signed in

  Rule: A merchant should only be able to view its own inventory.

  Rule: The application should only be available to registered users

    Example: Registered clerk accesses inventory page
      Given I am a registered clerk
      And I have signed in
      When I try to view the inventory
      Then I should see the inventory

    Example: Unregistered visitor accesses inventory page
      Given I am not a registered clerk
      When I try to view the inventory
      Then I should not be able to see the inventory
      And I should be directed to sign in
