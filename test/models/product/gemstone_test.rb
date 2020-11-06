# == Schema Information
#
# Table name: gemstones
#
#  id                      :bigint           not null, primary key
#  carat                   :decimal(5, 2)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  gemstone_subcategory_id :bigint           not null
#
# Indexes
#
#  index_gemstones_on_gemstone_subcategory_id  (gemstone_subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_subcategory_id => gemstone_subcategories.id)
#
require 'test_helper'

class Product
  class GemstoneTest < ActiveSupport::TestCase
    context 'associations' do
      should belong_to(:subcategory)
      should have_one(:mounted_gemstone)
      should have_one(:gemstone_product)
      should have_one(:diamond_color).through(:color_grade)
      should have_one(:diamond_cut).through(:cut_grade)
      should have_one(:diamond_clarity).through(:clarity_grade)
    end

    context 'validations' do
      should validate_numericality_of(:carat)
    end

    context 'attributes' do
      should respond_to?(:carat)
    end
  end
end
