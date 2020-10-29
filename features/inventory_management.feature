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

    Example: Selecting category during intake
      Given I have started the intake process
      When I look at the Gemstone category field
      Then I should see three options: Gemstone, Piece, or Miscellaneous

    Example: Viewing category after successful intake
      Given I have started the intake process
      And I have filled all required fields except for Category
      When I select the Gemstone category
      And I complete the intake process
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

  Rule: A gemstone must be sold and re-acquired as a new product in order to change its status from 'mounted' to 'loose'

    In order to change the status of a gemstone
    and keep clear accounting,
    as a jeweler,
    I need to sell the gemstone and piece
    and re-acquire them with the new association

    Example: Trying unsuccessfully to separate a gemstone from a piece by editing its record
      Given there is a gemstone
      And there is a piece with the gemstone above
      When I go to edit the gemstone above
      Then I should not see a way to mount the gemstone on a piece

    Example: Trying unsuccessfully to mount a gemstone by editing a piece record
      Given there is a piece
      When I go to edit the piece above
      Then I should not see a way to add gemstones
      And I should not see a way to remove gemstones

    Example: Changing a loose gemstone to a mounted one
      Given there is a gemstone
      And the gemstone above is loose
      When I change the gemstone's status from loose to mounted
      Then I should see that the gemstone is mounted to a jewelry piece
      And I should see that the gemstone has been sold to 'Anonymous'
      And I should see that the gemstone has been re-acquired from 'Anonymous'

    Example: Changing a mounted gemstone to a loose one
      Given there is a gemstone
      And there is a piece with the gemstone above
      When I change the gemstone's status from mounted to loose
      Then I should see that the gemstone is loose
      And I should see that the gemstone has been sold to 'Anonymous'
      And I should see that the gemstone has been re-acquired from 'Anonymous'

  Rule: A gemstone can be mounted on a piece or sold as a loose gemstone, but not both

  Rule: A piece cannot be associated with a loose gemstone, only a mounted one

  Rule: A gemstone can be a diamond or not

  Rule: A gemstone that is a diamond has three additional qualities: color, cut, and clarity

  Rule: A gemstone has zero or more lab reports given by gemstone laboratories

  Rule: A gemstone has a category and a subcategory
