# == Schema Information
#
# Table name: pieces
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  item_id              :bigint           not null
#  piece_subcategory_id :bigint           not null
#
# Indexes
#
#  index_pieces_on_item_id               (item_id)
#  index_pieces_on_piece_subcategory_id  (piece_subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (piece_subcategory_id => piece_subcategories.id)
#
require 'test_helper'

class Piece
  class ProfileTest < ActiveSupport::TestCase
    context 'associations' do
      should belong_to(:piece).inverse_of(:profile)
      should belong_to(:subcategory).inverse_of(:pieces)
      should have_many(:metals).inverse_of(:piece)
      should have_many(:mountings).inverse_of(:piece)
      should have_many(:gemstones).through(:mountings).inverse_of(:piece)
    end

    context 'nested_attributes' do
      should accept_nested_attributes_for(:metals).allow_destroy(true)
      should accept_nested_attributes_for(:gemstones).allow_destroy(true)
    end

    context 'delegations' do
      should delegate_method(:code).to(:subcategory).with_prefix
      should delegate_method(:name).to(:subcategory).with_prefix
    end
  end
end
