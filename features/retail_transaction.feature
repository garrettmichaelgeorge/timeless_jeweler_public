Feature: Retail transaction

  In order to effectively maintain inventory
  As a shop owner
  I need to record information about retail transactions

  Background:
    Given I am a registered user
    And I have logged in
    And I have started a new retail transaction

  Rule: A retail transaction consists of one or more items

    Example: Logging a transaction with no items
      Given I have not added any items
      When I click the submit button
      Then I should get an error message

    Example: Logging a transaction with one item
      Given I have not added any items
      When I add an item to the cart
      And I click the submit button
      Then I should get a success message

  Rule: An item's actual price is determined at checkout and may or may not match its regular price

    Example: Autocompletion of actual price with regular price
      When I add an item to the cart
      Then I should see a field for actual price with the regular price

    Example: Not changing the price at checkout
      When I add an item to the cart
      And I click submit
      Then the item's actual price should match its regular price

    Example: Changing the price at checkout
      Given I have an item in the cart
      When I change the actual price of the item
      And I complete the transaction
      Then the item's actual price should not match its regular price

  Rule: Gemstones can only be sold if they are loose (unattached)

    Example: Selling a loose gemstone
      Given I have a gemstone in inventory
      And the gemstone is loose
      When I include the gemstone in a sales transaction
      Then I should receive a success message

    Example: Trying to sell a gemstone attached to a piece
      Given I have a gemstone in inventory
      And the gemstone is attached to a piece
      When I include the gemstone in a sales transaction
      Then I should receive an error message

  Rule: When an item is sold in a retail transaction, it is removed from inventory

    Example: Selling an item
