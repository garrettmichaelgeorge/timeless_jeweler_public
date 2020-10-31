Feature: Intake

  The inventory has three categories: Gemstones, Jewelry Pieces, and
  Miscellaneous. Loose gemstones can be acquired or sold individually, while
  gemstones part of the composition of a piece can only be added or sold as part
  of the piece.

  In order to protect all assets
  As a shop owner
  I want to record all new inventory using an intake form

  Background:
    Given I have signed in
    Given I have started the intake process

  Rule: A successful intake should result in viewing the product page with the correct information

    Example: Intake of a ring with 2 gemstones
      When I input information for a ring
      And I specify that the product has 2 gemstones
      And I complete the intake process
      Then I should see the ring in my inventory
      And I should see that the ring has 2 gemstones

    Example: Intake of a necklace with no gemstones
      When I input information for a necklace
      And I complete the intake process
      Then I should see the necklace in my inventory
      And I should see that the necklace has no gemstones

    Example: Intake of a loose diamond
      When I input information for a loose diamond
      And I complete the intake process
      Then I should see the loose diamond in my inventory

    Example: Intake of a handbag
      When I input information for a handbag
      And I complete the intake process
      Then I should see the handbag in my inventory

  Rule: A gemstone's subcategory can be created on the fly
    Example: Creating a new gemstone subcategory during intake
