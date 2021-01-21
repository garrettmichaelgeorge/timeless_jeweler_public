@javascript
Feature: Intake

  The inventory has three categories: Gemstones, Jewelry Pieces, and
  Miscellaneous. Loose gemstones can be acquired or sold individually, while
  gemstones mounted on a piece can only be added or sold as part of the piece.

  In order to protect all assets,
  as a shop owner,
  I want to record all new inventory using an intake form

  Background:
    Given I am a registered user
      And I have signed in
      And I have started intake

  Rule: A successful intake should result in viewing the item page with the correct information

    Example: Intake of a piece with no gemstones
      When I specify that the item is a piece
       And I input information for a piece
       And I complete intake
      Then I should see the item page
       And I should see that the piece has no gemstones

    Example: Intake of a piece with 2 gemstones
      When I specify that the item is a piece
       And I input information for a piece
       And I add 2 metals to the piece
       And I complete intake
      Then I should see the item page
       And I should see that the piece has 2 gemstones

    Example: Intake of a loose gemstone
      When I specify that the item is a loose gemstone
       And I input information for a loose gemstone
       And I complete intake
      Then I should see the item page

    Example: Intake of a miscellaneous item
      When I specify that the item is a miscellaneous item
       And I input information for a miscellaneous item
       And I complete intake
      Then I should see the item page

  Rule: A gemstone's subcategory can be created on the fly

    Example: Creating a new gemstone subcategory during intake
