Feature: Inventory Management

  The inventory has three categories: Gemstones, Jewelry Pieces, and
  Miscellaneous. Loose gemstones can be acquired or sold individually, while
  gemstones part of the composition of a piece can only be added or sold as part
  of the piece.

  In order to protect all assets
  As a shop owner
  I want to record all new inventory using an intake form

  Background:
    Given I have signed in

  Rule: An item can have one of three categories: Gemstone, Piece, or Miscellaneous

    Example: Intake of an item
      Given I have started the intake process
      And I have filled all required fields except for Category
      When I select the Gemstone category
      And I press 'submit'
      Then I should see that the new item is labeled 'gemstone'

  Rule: A piece can have zero or more gemstones

    Scenario Outline: Intake of a piece
      Given I have started the intake process
      And I have selected the 'Piece' category
      When I add <added> gemstones to the piece above
      And I press 'submit'
      Then I should see that the piece has <expected> gemstones

      Examples: Different combinations of gemstones
        | added | expected |
        | 0     | 0        |
        | 1     | 1        |
        | 3     | 3        |

  Rule: The association of gemstone with piece cannot be changed while editing: only during intake

    In order to change the association of a gemstone with a piece
    and keep clear accounting,
    as a jeweler,
    I need to sell the gemstone and piece
    and re-acquire them with the new association

    Example: Trying to separate a gemstone from a piece by editing its record
      Given there is a gemstone
      And there is a piece with the gemstone above
      When I go to edit the gemstone above
      Then I should not see a way to mount the gemstone on a piece

    Example: Trying to mount a gemstone by editing a piece record
      Given there is a piece
      When I go to edit the piece above
      Then I should not see a way to add gemstones
      And I should not see a way to remove gemstones
