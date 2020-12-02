# == Schema Information
#
# Table name: gemstone_products
#
#  id                  :bigint           not null, primary key
#  gemstone_profile_id :bigint           not null
#
# Indexes
#
#  index_gemstone_products_on_gemstone_profile_id  (gemstone_profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_profile_id => gemstone_profiles.id)
#
require 'test_helper'

class GemstoneItemTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:gemstone)
      .dependent(:destroy)
      .autosave(true)
      .touch(true)
    should belong_to(:item)
  end

  context 'validations' do
  end

  context 'delegations' do
  end
end
