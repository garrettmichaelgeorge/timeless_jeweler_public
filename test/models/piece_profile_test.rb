# == Schema Information
#
# Table name: pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint           not null
#
# Indexes
#
#  index_pieces_on_item_id  (item_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#

require 'test_helper'

class PieceProfileTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:piece)
    should have_many(:metals)
    should have_many(:mountings)
    should have_many(:gemstones).through(:mountings)
  end

  describe '.table_name' do
    it 'should be correct' do
      _(described_class.table_name).must_equal 'pieces'
    end
  end
end
