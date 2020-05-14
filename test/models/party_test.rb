require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  def setup
    @party = Party.new(actable_id: 1)
  end

  test "should not save without associated subtype record" do
    @party.actable_id = nil
    assert_not @party.save, "Actable must exist"
  end

  test "should create a party_contact_method on save" do
    @party.save
    assert @party.party_contact_method, "Expected party to create a party contact method on save" 
  end
  
  test "should be able to find party_contact_method" do
    assert parties(:clara).party_contact_method, "Expected party to be able to find its party contact method"
  end

  test "should be able to find address" do
    assert parties(:clara).party_contact_method.address, "Expected party to be able to find its address"
  end
end
