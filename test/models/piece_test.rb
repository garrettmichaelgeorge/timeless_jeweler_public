# == Schema Information
#
# Table name: pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class PieceTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:item)
    should have_many(:mountings)
    should have_many(:gemstones).through(:mountings)
    should have_many(:metals)
  end

  context 'delegations' do
    context 'item' do
      ITEM_METHODS = %i[name description notes cost price].freeze

      ITEM_METHODS.each do |method|
        should delegate_method(method).to(:item)
      end
    end

    context 'metals' do
      METAL_METHODS = %i[category color purity].freeze

      METAL_METHODS.each do |method|
        should delegate_method(method).to(:metals).with_prefix
      end
    end
  end
end
