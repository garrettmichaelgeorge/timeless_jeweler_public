require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  def setup
    @party = Party.new(actable_id: 1)
  end

  test "should not save without associated subtype record" do
    @party.actable_id = nil
    assert_not @party.save, "Actable must exist"
  end

end