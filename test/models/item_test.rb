# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  cost_cents     :integer          default(0), not null
#  cost_currency  :string           default("USD"), not null
#  description    :text
#  name           :string(40)       not null
#  notes          :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  salable_type   :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_style_id  :bigint           not null
#  salable_id     :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#  index_products_on_salable     (salable_type,salable_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  SALABLE_TYPES = %i[Piece Gemstone MiscellaneousItem].freeze

  context 'associations' do
    should have_many(:store_transaction_line_items)
    should belong_to(:style)

    context 'salable' do
      SALABLE_TYPES.each do |salable|
        # should have_one(salable).dependent(:destroy).touch(true)
      end
      should accept_nested_attributes_for(:salable)
    end
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_length_of(:name).is_at_most(40)
  end

  context 'delegations' do
    should delegate_method(:name).to(:style).with_prefix
    should_eventually delegate_method(:public_send).to(:salable).with_arguments(:carat)
  end

  context 'monetize' do
    should('monetize price') { _(subject.price).must_be_instance_of Money }
    should('monetize cost')  { _(subject.cost).must_be_instance_of Money }
  end

  context '.build_as' do
    should 'call .build_as_piece' do
      mock = MiniTest::Mock.new
      mock.expect(:call, nil)
      Item.stub(:build_as_piece, mock) do
        Item.new.build_as_piece
      end
      mock.verify
    end

    should 'raise Method Missing error when sent message does not exist' do
      -> { Item.build_as(:something_random_) }.must_raise NoMethodError
    end
  end

  describe '.build_as_piece' do
    before do
      @item = Item.create_as_piece!
    end

    it 'sets salable type to "Piece"' do
      _(@item.salable_type).must_be 'Piece'
    end
  end
end
