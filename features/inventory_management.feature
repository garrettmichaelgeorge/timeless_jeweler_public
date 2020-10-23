Feature: Inventory Management

  The inventory has three categories: Gemstones, Jewelry Pieces, and
  Miscellaneous. Loose gemstones can be acquired or sold individually, while
  gemstones part of the composition of a piece can only be added or sold as part
  of the piece.

  In order to protect all assets
  As a shop owner
  I want to record all new inventory using an intake form

  Background:

  Rule: An item can have one of three categories: Gemstone, Piece, or
  Miscellaneous

    Example: Intake of an item
      Given I am on the New Item page
      When I select a category
      And I click the submit button
      Then I should see one of the allowed categories on the item's page

  Rule: A piece can have zero or more gemstones

    Example: Intake of a piece with no gemstones

    Example: Intake of a piece with one gemstone

    Example: Intake of a piece with three gemstones

  Rule: The association of gemstone with piece cannot be changed while editing,
  only during intake

    Example: Editing a gemstone attached to a piece
      Given I have a gemstone
      And the gemstone is attached to a piece
      When I navigate to the gemstone's Edit page
      Then I should not see a field to add or remove gemstones

    Example: Editing a piece
      Given I have a piece
      When I navigate to the piece's Edit page
      Then I should not see a field to add or remove gemstones
