Feature: Changing Gemstone Status

    In order to change the status of a gemstone
    and keep clear accounting,
    as a jeweler,
    I need to sell the gemstone and jewelry product
    and re-acquire them with the new association

  Rule: A gemstone must be sold and re-acquired as a new product in order to change its status from 'mounted' to 'loose'

    Example: Trying unsuccessfully to separate a gemstone from a jewelery product by editing its record
      Given there is a gemstone
      And there is a jewelry product with the gemstone above
      When I go to edit the gemstone above
      Then I should not see a way to mount the gemstone on a piece

    Example: Trying unsuccessfully to mount a gemstone by editing a piece record
      Given there is a jewelry product
      When I go to edit the piece above
      Then I should not see a way to add gemstones
      And I should not see a way to remove gemstones

    Example: Changing a gemstone's status from loose to mounted
      Given there is a gemstone product
      When I change the gemstone's status from loose to mounted
      Then I should see that the gemstone is mounted
      And I should see that the gemstone has been sold to 'Anonymous'
      And I should see that the gemstone has been re-acquired from 'Anonymous'

    Example: Changing a gemstone's status from mounted to loose
      Given there is a gemstone
      And there is a piece with the gemstone above
      When I change the gemstone's status from mounted to loose
      Then I should see that the gemstone is loose
      And I should see that the gemstone has been sold to 'Anonymous'
      And I should see that the gemstone has been re-acquired from 'Anonymous'
