# == Schema Information
#
# Table name: mounted_gemstones
#
#  gemstone_profile_id :bigint           not null
#  piece_id            :bigint           not null
#
# Indexes
#
#  index_mounted_gemstones_on_gemstone_profile_id  (gemstone_profile_id)
#  index_mounted_gemstones_on_piece_id             (piece_id)
#

require 'test_helper'

class MountedGemstoneTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:profile)
    should belong_to(:piece)
  end

  describe 'delegations' do
    it 'delegates #carat to #profile' do
      mounted_gemstone = described_class.new
      mounted_gemstone.carat = 3.55
      _(mounted_gemstone.carat).must_equal 3.55
    end
  end
end
