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
  subject { Party.new(actable_id: 1) }

  context 'associations' do
    should have_many(:purchases)
    should have_many(:purchase_line_items).through(:purchases)
    should have_many(:items).through(:purchase_line_items)
  end

  context 'delegations' do
    should delegate_method(:name).to(:specific)
  end

  it "doesn't save without associated subtype record" do
    subject.actable_id = nil
    assert_not subject.save, 'Actable must exist'
  end
end
