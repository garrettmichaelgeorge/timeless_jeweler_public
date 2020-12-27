# == Schema Information
#
# Table name: loose_gemstones
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  gemstone_profile_id :bigint           not null
#  item_id             :bigint           not null
#
# Indexes
#
#  index_loose_gemstones_on_gemstone_profile_id  (gemstone_profile_id)
#  index_loose_gemstones_on_item_id              (item_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_profile_id => gemstone_profiles.id)
#  fk_rails_...  (item_id => items.id)
#

require 'test_helper'

class LooseGemstoneTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:item)
    should belong_to(:profile)
  end

  describe 'delegations' do
    it 'delegates missing to #profile' do
      loose_gemstone = described_class.new
      loose_gemstone.carat = 3.55
      _(loose_gemstone.carat).must_equal 3.55
    end
  end
end
