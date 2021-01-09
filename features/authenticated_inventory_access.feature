Feature: Authenticated Inventory Access

  In order to secure my inventory,
  as a merchant,
  I want to restrict my inventory access to approved users only.

  Background:
    Given I am a registered user
      And I have signed in

  Rule: A merchant should only be able to view its own inventory.

    Example: Merchant visits the inventory page
      When I go to the inventory page
      Then I should see my inventory
