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
#  user_id        :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#  index_items_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class PieceTest < ActiveSupport::TestCase
  context 'associations' do
    should have_one(:profile)
  end

  context 'delegations' do
    should delegate_method(:metals).to(:profile)
    should delegate_method(:mountings).to(:profile)
    should delegate_method(:gemstones).to(:profile)
  end

  describe '#new' do
    it 'sets the category' do
      _(described_class.new.category).must_equal described_class.to_s
    end
  end
end

class Piece
  class ProfileTest < ActiveSupport::TestCase
    context 'associations' do
      should belong_to(:piece)
      should have_many(:metals)
      should have_many(:mountings)
      should have_many(:gemstones).through(:mountings)
    end

    should accept_nested_attributes_for(:metals).allow_destroy(true)
    should accept_nested_attributes_for(:gemstones).allow_destroy(true)

    describe '.table_name' do
      it 'should be correct' do
        _(described_class.table_name).must_equal 'pieces'
      end
    end
  end
end
