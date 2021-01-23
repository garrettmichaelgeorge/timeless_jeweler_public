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

class MountingTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:gemstone)
    should belong_to(:piece)
  end
end