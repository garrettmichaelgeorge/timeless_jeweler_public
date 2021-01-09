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

class PieceTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:item)
    should have_many(:metals)
    should have_many(:mounted_gemstones)
  end

  describe '#mounted_gemstones#build' do
    it 'builds mounted gemstones' do
      piece = described_class.new
      piece.mounted_gemstones.build
      _(piece.mounted_gemstones).wont_be_nil
    end
  end
end
