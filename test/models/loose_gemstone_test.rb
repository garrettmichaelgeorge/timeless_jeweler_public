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

class LooseGemstoneTest < ActiveSupport::TestCase
  context 'associations' do
    should have_one(:profile)
  end

  context 'delegations' do
    should delegate_method(:carat).to(:profile)

    describe '#carat=' do
      subject { LooseGemstone.new }

      it 'sets the carat' do
        subject.carat = 3.55
        _(subject.carat).must_equal 3.55
      end
    end
  end
end