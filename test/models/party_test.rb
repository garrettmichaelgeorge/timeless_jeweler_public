# == Schema Information
#
# Table name: parties
#
#  id           :bigint           not null, primary key
#  actable_type :string
#  party_type   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  actable_id   :integer
#
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
