# == Schema Information
#
# Table name: mountings
#
#  gemstone_id :bigint           not null
#  piece_id    :bigint           not null
#
# Indexes
#
#  index_mountings_on_gemstone_id  (gemstone_id)
#  index_mountings_on_piece_id     (piece_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_id => gemstones.id)
#  fk_rails_...  (piece_id => pieces.id)
#

require 'test_helper'

class MountingTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:gemstone)
    should belong_to(:piece)
  end
end
