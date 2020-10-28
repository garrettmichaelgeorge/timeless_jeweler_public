# == Schema Information
#
# Table name: loose_gemstones
#
#  gemstone_id :bigint           not null
#  product_id  :bigint           not null
#
# Indexes
#
#  index_loose_gemstones_on_gemstone_id  (gemstone_id)
#  index_loose_gemstones_on_product_id   (product_id)
#
require 'test_helper'

class Gemstone::LooseGemstoneTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:gemstone)
    should belong_to(:product)
  end
end
