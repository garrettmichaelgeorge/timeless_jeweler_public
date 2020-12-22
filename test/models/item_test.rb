# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  category       :string(20)
#  cost_cents     :integer          default(0), not null
#  cost_currency  :string           default("USD"), not null
#  description    :text
#  name           :string(40)       not null
#  notes          :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_style_id  :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  CATEGORIES = %w[Piece Gemstone MiscellaneousItem].freeze
  context 'associations' do
    should have_many(:store_transaction_line_items)
    should belong_to(:style)
    should have_one(:piece)
    should have_one(:gemstone)
    should have_one(:miscellaneous_item)
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_length_of(:name).is_at_most(40)
    should validate_presence_of(:category)
    should validate_length_of(:category).is_at_most(20)
    should validate_inclusion_of(:category).in_array(CATEGORIES)
  end

  context 'delegations' do
    should delegate_method(:name).to(:style).with_prefix
    should_eventually delegate_method(:public_send).to(:salable).with_arguments(:carat)
  end

  context 'config' do
    should('monetize price') { _(subject.price).must_be_instance_of Money }
    should('monetize cost')  { _(subject.cost).must_be_instance_of Money }
    should accept_nested_attributes_for(:piece)
    should accept_nested_attributes_for(:gemstone)
    should accept_nested_attributes_for(:miscellaneous_item)
  end

  describe '.build_as_piece' do
    before do
      @item = described_class.build_as_piece(FactoryBot.attributes_for(:item))
    end

    it 'builds a piece' do
      _(@item.piece).wont_be :nil?
    end

    it 'sets the category' do
      _(@item.category).must_equal 'Piece'
    end
  end

  describe '.build_as_gemstone' do
    before do
      @item = described_class.build_as_gemstone(FactoryBot.attributes_for(:item))
    end

    it 'builds a gemstone' do
      _(@item.gemstone).wont_be :nil?
    end

    it 'sets the category' do
      _(@item.category).must_equal 'Gemstone'
    end
  end

  describe '.build_as_miscellaneous_item' do
    before do
      @item = described_class.build_as_miscellaneous_item(FactoryBot.attributes_for(:item))
    end

    it 'builds a piece' do
      _(@item.miscellaneous_item).wont_be :nil?
    end

    it 'sets the category' do
      _(@item.category).must_equal 'MiscellaneousItem'
    end
  end
end
