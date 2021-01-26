# == Schema Information
#
# Table name: sales
#
#  id          :bigint           not null, primary key
#  occurred_at :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  party_id    :bigint           not null
#
# Indexes
#
#  index_sales_on_occurred_at  (occurred_at) UNIQUE
#  index_sales_on_party_id     (party_id)
#
# Foreign Keys
#
#  fk_rails_...  (party_id => parties.id)
#
require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  subject { described_class.new }

  context 'associations' do
    should belong_to(:party)
    should have_many(:line_items)
    should have_many(:items).through(:line_items)
  end

  context 'delegations' do
    should delegate_method(:price).to(:line_items)
    should delegate_method(:name).to(:party).with_prefix(true)
  end

  it 'monetizes money attributes' do
    assert_monetized subject, :total
  end
end
