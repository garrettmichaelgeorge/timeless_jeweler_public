# == Schema Information
#
# Table name: items
#
#  id                       :bigint           not null, primary key
#  acquired_at              :datetime         not null
#  category                 :string(20)
#  cost_cents               :integer          default(0), not null
#  cost_currency            :string           default("USD"), not null
#  description              :text
#  name                     :string(40)       not null
#  notes                    :text
#  price_cents              :integer          default(0), not null
#  price_currency           :string           default("USD"), not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  item_ownership_status_id :bigint           not null
#  item_style_id            :bigint           not null
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_items_on_item_ownership_status_id  (item_ownership_status_id)
#  index_items_on_item_style_id             (item_style_id)
#  index_items_on_user_id                   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_ownership_status_id => item_ownership_statuses.id)
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
  end
end

class LooseGemstone
  class ProfileTest < ActiveSupport::TestCase
    subject { described_class.new }

    context 'associations' do
      should belong_to(:loose_gemstone)
      should belong_to(:gemstone)
    end

    context 'delegations' do
      should delegate_method(:carat).to(:gemstone)
    end
  end
end
